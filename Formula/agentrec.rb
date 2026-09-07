class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.10.0/agentrec_0.10.0_darwin_arm64.tar.gz"
      sha256 "a204b7c8275777810f6abcb96cda4ed758831f912b504c7d7c1c67c562b64dce"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.10.0/agentrec_0.10.0_darwin_amd64.tar.gz"
      sha256 "430929fd9b3f73510f5b4f8b7a52f6dda940485475f107e6be60daf792dd38b0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.10.0/agentrec_0.10.0_linux_arm64.tar.gz"
      sha256 "c49cfd41d2002eed0c96c9a5419b96715ff617a8dd1a436ba4aeea9569f03260"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.10.0/agentrec_0.10.0_linux_amd64.tar.gz"
      sha256 "c202b8823dcef04fdcf20eb473a690171ddd8732f69a5d524efc74d63da8ee35"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.10.0", shell_output("#{bin}/agentrec version")
  end
end
