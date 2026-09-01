class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.3.0/agentrec_0.3.0_darwin_arm64.tar.gz"
      sha256 "e0ee34a594dd74237be3c7496306647d6ba461d0991ea5720cd42296e6bcd911"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.3.0/agentrec_0.3.0_darwin_amd64.tar.gz"
      sha256 "d45b484f5884b9c89791ae2de701eb70d275153c1773deb3ffa4b160c1188013"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.3.0/agentrec_0.3.0_linux_arm64.tar.gz"
      sha256 "cbfdde64cbb54b6da45bb1f87c21e3fdb0e8bf6cffe5896f7c9338e71c741da5"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.3.0/agentrec_0.3.0_linux_amd64.tar.gz"
      sha256 "a35c6f708f65bb2ca593125a7db9ebd3f185a28105ff3cc9f3c68f1095eda1cd"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.3.0", shell_output("#{bin}/agentrec version")
  end
end
