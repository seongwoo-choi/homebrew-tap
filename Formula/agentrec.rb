class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.11.0/agentrec_0.11.0_darwin_arm64.tar.gz"
      sha256 "6d67c8b1831063ae1829d09795e0a6c3c4cd619a22dd31363e90509722b4ff55"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.11.0/agentrec_0.11.0_darwin_amd64.tar.gz"
      sha256 "afe8cadd29a129eea7b796c6e85f50e0b6788773a15f0d972000455baf3552b1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.11.0/agentrec_0.11.0_linux_arm64.tar.gz"
      sha256 "1a4ffcbfd0978ecb0464b66bd48a876a1f7771e909e5694a1f8bbcad46a3c5a8"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.11.0/agentrec_0.11.0_linux_amd64.tar.gz"
      sha256 "01c4e6f0f5c4624c6e0816028d7012a19bb34a7b565c77276f1b7d90231e0304"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.11.0", shell_output("#{bin}/agentrec version")
  end
end
