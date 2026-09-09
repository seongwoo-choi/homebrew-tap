class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.14.0/agentrec_0.14.0_darwin_arm64.tar.gz"
      sha256 "848f425342329d7cd843d3e2867b91ded69587432aaebef483841cf0508eaa9e"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.14.0/agentrec_0.14.0_darwin_amd64.tar.gz"
      sha256 "018339962a0a98c147a0179ce48e0b9267da72729240c9e44e963e878355dea0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.14.0/agentrec_0.14.0_linux_arm64.tar.gz"
      sha256 "2a3355c9de6686a2703207aca840d97ca458cc40ecad37d7ce53ae8fafbcc80b"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.14.0/agentrec_0.14.0_linux_amd64.tar.gz"
      sha256 "d8866772c5056b62d041d0ab0c68239555c4571e42350c99cf3376dbba468baa"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.14.0", shell_output("#{bin}/agentrec version")
  end
end
