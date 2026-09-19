class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.0/agentrec_0.15.0_darwin_arm64.tar.gz"
      sha256 "40ab114c639fc1dac08e767e1bef7b0cbf166ab7e14a53ed93989c45e27f13f1"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.0/agentrec_0.15.0_darwin_amd64.tar.gz"
      sha256 "c9a279897a89f4debbfeebdf21767341c0e42808573df5fb6d30469878e16578"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.0/agentrec_0.15.0_linux_arm64.tar.gz"
      sha256 "1e4a76f29cdbe1391c29058e5e4c17041423ca1b8d2f3c679fb75b9b1557a4da"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.0/agentrec_0.15.0_linux_amd64.tar.gz"
      sha256 "54515e7bdd9b6af21d718462709ec6ed6110a7f6c1da6ea43858de9694622762"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.15.0", shell_output("#{bin}/agentrec version")
  end
end
