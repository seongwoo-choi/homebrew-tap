class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.5.0/agentrec_0.5.0_darwin_arm64.tar.gz"
      sha256 "ba3e52fba2dd2b9d4efd43ff43715436cbbae1b32fa974aac8f93e5ae303e1ad"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.5.0/agentrec_0.5.0_darwin_amd64.tar.gz"
      sha256 "274c888e0204240917d6eabbf0c7ecb4b9ee85414b7504bd3ad17dac1c243f40"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.5.0/agentrec_0.5.0_linux_arm64.tar.gz"
      sha256 "0489a2b00f11ce87a3433e4859b821ba7145b1a87813334131f871542d704422"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.5.0/agentrec_0.5.0_linux_amd64.tar.gz"
      sha256 "ae0f339cdb0d78651835b91c8e49b3b7bce1d895937d7de62d3be08b60d876f6"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.5.0", shell_output("#{bin}/agentrec version")
  end
end
