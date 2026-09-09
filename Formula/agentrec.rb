class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.12.0/agentrec_0.12.0_darwin_arm64.tar.gz"
      sha256 "6006448bd950597778c576f537e33a40e4e6f88bb2e22811de86960bf6541d13"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.12.0/agentrec_0.12.0_darwin_amd64.tar.gz"
      sha256 "ecbfece5c5b07777da18cbc8ff198adf0bf66fdb53717f84ef848c2343e9f224"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.12.0/agentrec_0.12.0_linux_arm64.tar.gz"
      sha256 "72a4302547dd857bd69b3424d09e4139034d0ef52d9d26173dfcb504a468589b"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.12.0/agentrec_0.12.0_linux_amd64.tar.gz"
      sha256 "1608ff65ae09a38cc26b5543812185294079cec2674599d3f3d96ccee19841a6"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.12.0", shell_output("#{bin}/agentrec version")
  end
end
