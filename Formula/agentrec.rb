class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.20.0/agentrec_0.20.0_darwin_arm64.tar.gz"
      sha256 "486e1c8d90a8525347b055d4b12a746ffdab018900566323b6c8411dfbcccf1a"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.20.0/agentrec_0.20.0_darwin_amd64.tar.gz"
      sha256 "25f35c8f1731ff37406b3b5da99341e6779c67bd797b1dac12c150edfa3ab086"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.20.0/agentrec_0.20.0_linux_arm64.tar.gz"
      sha256 "0e39452f1e57c216b775a047ea099d13f951c07beb1b2fc18b7042f154106cfc"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.20.0/agentrec_0.20.0_linux_amd64.tar.gz"
      sha256 "ef68232672822c81e5608438ddf3853026e2f52926fc9e7d578859041fe850d7"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.20.0", shell_output("#{bin}/agentrec version")
  end
end
