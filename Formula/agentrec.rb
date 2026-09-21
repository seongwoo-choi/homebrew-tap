class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.3/agentrec_0.15.3_darwin_arm64.tar.gz"
      sha256 "9d5c921934d15a4becf2d1b5e59798553c15a66cb4bcc26ae6536fd9680a2a8a"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.3/agentrec_0.15.3_darwin_amd64.tar.gz"
      sha256 "6fdaea195d96455634cd118e7c8e590df198902b822c4a374495bd77aac1dbeb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.3/agentrec_0.15.3_linux_arm64.tar.gz"
      sha256 "fa314b5775346f7d5f352ca0a784cb26f1e54c3a515acf1ef3ec06cb00ccbb17"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.3/agentrec_0.15.3_linux_amd64.tar.gz"
      sha256 "71d646fccfc2d3c97f2d35ba102e597d01c74c005ef332c58cc98bcf11631c44"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.15.3", shell_output("#{bin}/agentrec version")
  end
end
