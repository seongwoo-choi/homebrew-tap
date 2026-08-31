import importlib.util
import json
import os
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path


class UpdateAgentrecFormulaTest(unittest.TestCase):
    def test_token_is_only_sent_to_github_api(self):
        script = Path(__file__).parents[1] / "scripts" / "update-agentrec.py"
        spec = importlib.util.spec_from_file_location("update_agentrec", script)
        if spec is None or spec.loader is None:
            self.fail("could not load updater module")
        module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(module)
        previous = os.environ.get("GITHUB_TOKEN")
        os.environ["GITHUB_TOKEN"] = "test-token"
        try:
            self.assertIn("Authorization", module.request_headers(authenticated=True))
            self.assertNotIn("Authorization", module.request_headers(authenticated=False))
        finally:
            if previous is None:
                os.environ.pop("GITHUB_TOKEN", None)
            else:
                os.environ["GITHUB_TOKEN"] = previous

    def test_generates_formula_from_release_and_checksums(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            release = root / "release.json"
            checksums = root / "SHA256SUMS"
            formula = root / "Formula" / "agentrec.rb"
            assets = []
            lines = []
            values = {
                "darwin_amd64": "1" * 64,
                "darwin_arm64": "2" * 64,
                "linux_amd64": "3" * 64,
                "linux_arm64": "4" * 64,
            }
            for platform, digest in values.items():
                name = f"agentrec_1.2.3_{platform}.tar.gz"
                assets.append({"name": name, "browser_download_url": f"https://example.test/{name}"})
                lines.append(f"{digest}  {name}")
            assets.append({"name": "SHA256SUMS", "browser_download_url": "https://example.test/SHA256SUMS"})
            release.write_text(json.dumps({"tag_name": "v1.2.3", "draft": False, "prerelease": False, "assets": assets}))
            checksums.write_text("\n".join(lines) + "\n")

            subprocess.run([
                sys.executable,
                str(Path(__file__).parents[1] / "scripts" / "update-agentrec.py"),
                "--release-json", str(release),
                "--checksums", str(checksums),
                "--formula", str(formula),
            ], check=True)

            content = formula.read_text()
            self.assertNotIn('version "1.2.3"', content)
            for platform, digest in values.items():
                self.assertIn(f"agentrec_1.2.3_{platform}.tar.gz", content)
                self.assertIn(f'sha256 "{digest}"', content)
            self.assertIn('assert_match "agentrec v1.2.3"', content)
            self.assertIn('bin.install "agentrec"', content)

    def test_rejects_downgrade_and_same_version_drift(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            formula = root / "Formula" / "agentrec.rb"
            script = str(Path(__file__).parents[1] / "scripts" / "update-agentrec.py")

            def release(version, digest):
                release_path = root / f"release-{version}-{digest[0]}.json"
                checksums_path = root / f"checksums-{version}-{digest[0]}"
                assets = []
                lines = []
                for platform in ("darwin_amd64", "darwin_arm64", "linux_amd64", "linux_arm64"):
                    name = f"agentrec_{version}_{platform}.tar.gz"
                    assets.append({"name": name, "browser_download_url": f"https://example.test/{name}"})
                    lines.append(f"{digest}  {name}")
                assets.append({"name": "SHA256SUMS", "browser_download_url": "https://example.test/SHA256SUMS"})
                release_path.write_text(json.dumps({"tag_name": f"v{version}", "draft": False, "prerelease": False, "assets": assets}))
                checksums_path.write_text("\n".join(lines) + "\n")
                return release_path, checksums_path

            current, current_sums = release("1.2.3", "a" * 64)
            subprocess.run([sys.executable, script, "--release-json", str(current), "--checksums", str(current_sums), "--formula", str(formula)], check=True)

            downgrade, downgrade_sums = release("1.2.2", "b" * 64)
            result = subprocess.run([sys.executable, script, "--release-json", str(downgrade), "--checksums", str(downgrade_sums), "--formula", str(formula)])
            self.assertNotEqual(result.returncode, 0)

            drift, drift_sums = release("1.2.3", "c" * 64)
            result = subprocess.run([sys.executable, script, "--release-json", str(drift), "--checksums", str(drift_sums), "--formula", str(formula)])
            self.assertNotEqual(result.returncode, 0)


if __name__ == "__main__":
    unittest.main()
