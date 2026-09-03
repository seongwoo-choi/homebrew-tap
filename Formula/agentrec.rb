class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.7.0/agentrec_0.7.0_darwin_arm64.tar.gz"
      sha256 "52fbe602fc8a12c031e7d0dcd59d48230c82c9e3717b8d5a25cbe2ffcef9fbf2"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.7.0/agentrec_0.7.0_darwin_amd64.tar.gz"
      sha256 "17f066b2536d99f6dab09d71ab4e15ba3d2161278e2efaba264ced533de27f47"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.7.0/agentrec_0.7.0_linux_arm64.tar.gz"
      sha256 "641b3ac4a03ffc973705a38fac4e890e9076f3cfff1005597d799e5796607362"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.7.0/agentrec_0.7.0_linux_amd64.tar.gz"
      sha256 "7bc0bea292718b9c2920d03653738463ecc82d148ada4fde57d61011a6583220"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.7.0", shell_output("#{bin}/agentrec version")
  end
end
