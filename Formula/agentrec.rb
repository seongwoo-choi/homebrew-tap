class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.16.1/agentrec_0.16.1_darwin_arm64.tar.gz"
      sha256 "b82dfd2f7b7a710cf7a224a344c41f8c869e5c88e02fa764f2f616a4ebdd3125"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.16.1/agentrec_0.16.1_darwin_amd64.tar.gz"
      sha256 "ad0d2178b57012305088a5eeec52b4994fd714707a891873d35016cee6be2bb3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.16.1/agentrec_0.16.1_linux_arm64.tar.gz"
      sha256 "179da5e58493315efcff181489fb9e26e2f24ca66cece520e97f77956ed79b25"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.16.1/agentrec_0.16.1_linux_amd64.tar.gz"
      sha256 "4bd96df68a8a5e5f408e34a1bc0f87b796ba811f05df88b8ec26f33ae89f301c"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.16.1", shell_output("#{bin}/agentrec version")
  end
end
