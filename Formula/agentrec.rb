class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.5/agentrec_0.15.5_darwin_arm64.tar.gz"
      sha256 "dadde9b8ac0437a4c622367cec16c4be191087ff78cce6e71cf300941ef92861"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.5/agentrec_0.15.5_darwin_amd64.tar.gz"
      sha256 "af951ced7c02bafc1c03ab1732be5b31432de388fd17e461538de201e0c08e66"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.5/agentrec_0.15.5_linux_arm64.tar.gz"
      sha256 "58380cd3532730b65f438ee1f87669b0a654f5a9eb755a64dd23690a1f94d311"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.5/agentrec_0.15.5_linux_amd64.tar.gz"
      sha256 "4b72c0c1cd0337fb8a0bdf49526d6483ac422dbf6ba48cbac9e360970be4f586"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.15.5", shell_output("#{bin}/agentrec version")
  end
end
