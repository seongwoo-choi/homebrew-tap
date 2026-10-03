class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.21.0/agentrec_0.21.0_darwin_arm64.tar.gz"
      sha256 "8a0a433ae505f4209e168240600d43cb8883fe5946f996de22fbf8a6c816f1b2"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.21.0/agentrec_0.21.0_darwin_amd64.tar.gz"
      sha256 "41316867a67e8e026570c2c57e34b7aa8f66ac96f37209c60d138e07b57cf07a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.21.0/agentrec_0.21.0_linux_arm64.tar.gz"
      sha256 "ff7f44c3f5aec9de040122c51953cee6f11f54e5d5543a0a42307b329568527a"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.21.0/agentrec_0.21.0_linux_amd64.tar.gz"
      sha256 "97da3f07018ad699dcbc51602142061806c9023aad96701d78a9272d2bbfe132"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.21.0", shell_output("#{bin}/agentrec version")
  end
end
