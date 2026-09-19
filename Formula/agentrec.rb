class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.1/agentrec_0.15.1_darwin_arm64.tar.gz"
      sha256 "e59bab5104deddfc5acd280ad1e9aeec7b83dea8274fd84a7fedc4e47b78571d"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.1/agentrec_0.15.1_darwin_amd64.tar.gz"
      sha256 "6af615312fcb0b1ba23bce5823455ed73077140f33cf32025ca0debeaf59497a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.1/agentrec_0.15.1_linux_arm64.tar.gz"
      sha256 "2431a8e79d2838c87c8fc24edd9152f472f66d1c0cc79e1fce216c21e47ab529"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.1/agentrec_0.15.1_linux_amd64.tar.gz"
      sha256 "b23ea7705f6f3138d53899930b85c20e4017ec1a44636ad899932447c68d0673"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.15.1", shell_output("#{bin}/agentrec version")
  end
end
