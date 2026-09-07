class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.10.2/agentrec_0.10.2_darwin_arm64.tar.gz"
      sha256 "84c204a19a43b3561fa2d702ee71ce78958ae559ecc2ce7c1145ffead96443c9"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.10.2/agentrec_0.10.2_darwin_amd64.tar.gz"
      sha256 "823c04cb302422d171eb7c0e0469dc1087c040d059b2ce699d6d842f5b492f22"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.10.2/agentrec_0.10.2_linux_arm64.tar.gz"
      sha256 "454d5fa68aeb8ba40d8792a8d58de28e58a0c54406aed1d7106a0c8f02ff1adc"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.10.2/agentrec_0.10.2_linux_amd64.tar.gz"
      sha256 "01890b908f5f809300544bcb1e8969eee5fba7bb04c42a325eed065b98e3d423"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.10.2", shell_output("#{bin}/agentrec version")
  end
end
