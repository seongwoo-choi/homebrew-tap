class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.11.1/agentrec_0.11.1_darwin_arm64.tar.gz"
      sha256 "acb00d4a8814a9016bdbe67f00bd16fb1a937758dbe38b6ee5bb04a5711eb271"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.11.1/agentrec_0.11.1_darwin_amd64.tar.gz"
      sha256 "818d2a98578e6232055982d72b20e652da3d2fc88747dd8d641f5102bb91c394"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.11.1/agentrec_0.11.1_linux_arm64.tar.gz"
      sha256 "444f3ed77c6b8482929aac3d16c5a32746c27627bc8cc83e6bdbc7b54a70729e"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.11.1/agentrec_0.11.1_linux_amd64.tar.gz"
      sha256 "11656a055943bc76b2ba840f34491079b006da68b94e8123d00fd24aa925ff9a"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.11.1", shell_output("#{bin}/agentrec version")
  end
end
