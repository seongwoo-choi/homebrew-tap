class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.8.0/agentrec_0.8.0_darwin_arm64.tar.gz"
      sha256 "d187e6a5e163cc3994b1bc623f5c67ef147fae92690b537e6e0e6639ac656c8e"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.8.0/agentrec_0.8.0_darwin_amd64.tar.gz"
      sha256 "fddead5b41a48847d52d0a2f86e1192fd4f280ba7db1f383961dccdc23968380"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.8.0/agentrec_0.8.0_linux_arm64.tar.gz"
      sha256 "c4863915c6cd41bd0209db63d0d3ef4a1b05c6f7f44f4540fe193eeda4496022"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.8.0/agentrec_0.8.0_linux_amd64.tar.gz"
      sha256 "5506f51c295a6d25653aca15eba6d5ee136e260021afaa7f7dea31c6a0d6135f"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.8.0", shell_output("#{bin}/agentrec version")
  end
end
