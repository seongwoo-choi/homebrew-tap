#!/usr/bin/env python3
import argparse
import json
import os
import re
import urllib.request
from pathlib import Path

REPOSITORY = "seongwoo-choi/agentrec"
PLATFORMS = ("darwin_amd64", "darwin_arm64", "linux_amd64", "linux_arm64")


def request_headers(authenticated):
    headers = {"User-Agent": "homebrew-agentrec-updater"}
    if authenticated:
        headers["Accept"] = "application/vnd.github+json"
        if os.environ.get("GITHUB_TOKEN"):
            headers["Authorization"] = f"Bearer {os.environ['GITHUB_TOKEN']}"
    return headers


def fetch_json(url):
    request = urllib.request.Request(url, headers=request_headers(authenticated=True))
    with urllib.request.urlopen(request, timeout=30) as response:
        return json.load(response)


def fetch_text(url):
    request = urllib.request.Request(url, headers=request_headers(authenticated=False))
    with urllib.request.urlopen(request, timeout=30) as response:
        return response.read().decode("utf-8")


def load_release(path):
    if path:
        return json.loads(Path(path).read_text())
    return fetch_json(f"https://api.github.com/repos/{REPOSITORY}/releases/latest")


def parse_checksums(text):
    result = {}
    for line in text.splitlines():
        parts = line.split()
        if len(parts) != 2 or not re.fullmatch(r"[0-9a-f]{64}", parts[0]):
            raise SystemExit("invalid SHA256SUMS")
        if parts[1] in result:
            raise SystemExit(f"duplicate checksum for {parts[1]}")
        result[parts[1]] = parts[0]
    return result


def formula(version, assets, checksums):
    values = {}
    for platform in PLATFORMS:
        name = f"agentrec_{version}_{platform}.tar.gz"
        if name not in assets or name not in checksums:
            raise SystemExit(f"release is missing {name}")
        values[platform] = (assets[name], checksums[name])

    def source(platform, indent="    "):
        url, digest = values[platform]
        return f'{indent}url "{url}"\n{indent}sha256 "{digest}"'

    return f'''class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/{REPOSITORY}"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
{source("darwin_arm64", "      ")}
    else
{source("darwin_amd64", "      ")}
    end
  end

  on_linux do
    if Hardware::CPU.arm?
{source("linux_arm64", "      ")}
    else
{source("linux_amd64", "      ")}
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v{version}", shell_output("#{{bin}}/agentrec version")
  end
end
'''


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--release-json")
    parser.add_argument("--checksums")
    parser.add_argument("--formula", default="Formula/agentrec.rb")
    args = parser.parse_args()

    release = load_release(args.release_json)
    tag = release.get("tag_name", "")
    match = re.fullmatch(r"v(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)", tag)
    if not match or release.get("draft") or release.get("prerelease"):
        raise SystemExit("latest release is not a stable semantic version")
    version = tag[1:]
    assets = {asset["name"]: asset["browser_download_url"] for asset in release.get("assets", [])}
    checksum_url = assets.get("SHA256SUMS")
    if not checksum_url and not args.checksums:
        raise SystemExit("release is missing SHA256SUMS")
    checksum_text = Path(args.checksums).read_text() if args.checksums else fetch_text(checksum_url)
    generated = formula(version, assets, parse_checksums(checksum_text))
    output = Path(args.formula)
    if output.exists():
        current = output.read_text()
        versions = set(re.findall(r'agentrec_([0-9]+\.[0-9]+\.[0-9]+)_(?:darwin|linux)_', current))
        if len(versions) != 1:
            raise SystemExit("existing formula has no single semantic version")
        current_version = tuple(int(part) for part in versions.pop().split("."))
        next_version = tuple(int(part) for part in version.split("."))
        if next_version < current_version:
            raise SystemExit("refusing to downgrade formula")
        if next_version == current_version:
            source_pattern = r'^\s+(url|sha256) "([^"]+)"$'
            if re.findall(source_pattern, current, re.MULTILINE) != re.findall(source_pattern, generated, re.MULTILINE):
                raise SystemExit("refusing same-version asset replacement")
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(generated)
    print(f"updated {output} to {tag}")


if __name__ == "__main__":
    main()
