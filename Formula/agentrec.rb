class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.9.0/agentrec_0.9.0_darwin_arm64.tar.gz"
      sha256 "8ce652d10e9a2530cd585dfe6dd70ab0bd6b2bc7682514cd732fb2339aae1257"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.9.0/agentrec_0.9.0_darwin_amd64.tar.gz"
      sha256 "2d21de51b2d032aaeb49a5458d33bff71bb4df9d07e21788509e229103d1e628"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.9.0/agentrec_0.9.0_linux_arm64.tar.gz"
      sha256 "e04af8635c4fda114b1be3cc065a5b104ca00a3463550468a6c3e7bfb349e6a6"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.9.0/agentrec_0.9.0_linux_amd64.tar.gz"
      sha256 "c3722482d68c53faf119eb3fbadf080cf0c85156c92db11cbcb2320368b92b00"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.9.0", shell_output("#{bin}/agentrec version")
  end
end
