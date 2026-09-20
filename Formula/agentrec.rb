class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.2/agentrec_0.15.2_darwin_arm64.tar.gz"
      sha256 "b42ff3c62b8d89d860560a60fef012113a8ebbaf6871595960c22cdfee8c10de"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.2/agentrec_0.15.2_darwin_amd64.tar.gz"
      sha256 "e7161e2393cef47efaf918f658626405e949d9b12403e1c8c1c8473992c68a73"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.2/agentrec_0.15.2_linux_arm64.tar.gz"
      sha256 "ea6327cd48f6608240d830ed05a948806f02c853b472d688b04fba5af7dee853"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.2/agentrec_0.15.2_linux_amd64.tar.gz"
      sha256 "1d7288ed0215fb09789413c44e2d33077fdfe3f07aac7731d35e177d3d1faffb"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.15.2", shell_output("#{bin}/agentrec version")
  end
end
