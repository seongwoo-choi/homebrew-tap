class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.10.1/agentrec_0.10.1_darwin_arm64.tar.gz"
      sha256 "868c85fb5f65192c9a59c08da56b40850b104aee32422138d65b57a3c90818f2"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.10.1/agentrec_0.10.1_darwin_amd64.tar.gz"
      sha256 "cac4a8fd454c5ae4515b5421005265eea42698077402156151e38285cd3119bd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.10.1/agentrec_0.10.1_linux_arm64.tar.gz"
      sha256 "16fa6a74aa4ab98c8862020203b46986682c634b3da1c4bca52cf42ee617556a"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.10.1/agentrec_0.10.1_linux_amd64.tar.gz"
      sha256 "66aa21141ebd3d34f51755e2f9857feb7770b01513a8ac9a7d4225914a67dc21"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.10.1", shell_output("#{bin}/agentrec version")
  end
end
