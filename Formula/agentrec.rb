class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.16.0/agentrec_0.16.0_darwin_arm64.tar.gz"
      sha256 "43bd4fda0fb544cdcadb7d43f55917e9fdf59b4fa2b702fab9e30aba939006fa"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.16.0/agentrec_0.16.0_darwin_amd64.tar.gz"
      sha256 "22b284cda14a010bd983d90d17da5f270f2dcb90288db1e353a341c598f369b2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.16.0/agentrec_0.16.0_linux_arm64.tar.gz"
      sha256 "8225a54a4a639e76c7dcf928dbaebce312999ec5ee90ee7c5c88d474616d1bff"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.16.0/agentrec_0.16.0_linux_amd64.tar.gz"
      sha256 "79212b2a405e513c8c913767430a172b476b994e8d9fd8959e142e64caf56d14"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.16.0", shell_output("#{bin}/agentrec version")
  end
end
