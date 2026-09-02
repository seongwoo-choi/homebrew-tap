class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.6.0/agentrec_0.6.0_darwin_arm64.tar.gz"
      sha256 "8d821d326ff5c361fc967ef2c4177b000223ddf7c2555f047a2a89857307e691"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.6.0/agentrec_0.6.0_darwin_amd64.tar.gz"
      sha256 "32a4d6050e49720887b7675d9b4747a8bb1a3b573052c47181fe6581e49a9806"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.6.0/agentrec_0.6.0_linux_arm64.tar.gz"
      sha256 "a9b0a9d8b402fc93d39dea180fe9449e511d95319a9c302c2ecb301253016e44"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.6.0/agentrec_0.6.0_linux_amd64.tar.gz"
      sha256 "ae3ae837a65a5cd0b5d8dc0652a95ac2c5ccfd16b3e0f067a41def2c13410acc"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.6.0", shell_output("#{bin}/agentrec version")
  end
end
