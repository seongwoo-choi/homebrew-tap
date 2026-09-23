class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.4/agentrec_0.15.4_darwin_arm64.tar.gz"
      sha256 "445852fb8c12866615c263771af62df1f91793824195b03cf0f519e92f238eda"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.4/agentrec_0.15.4_darwin_amd64.tar.gz"
      sha256 "72f8f27a345334e073b007ff807df2da71557193f5452389768d42b1c7a4ec00"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.4/agentrec_0.15.4_linux_arm64.tar.gz"
      sha256 "7d81bc721baf02c014bed4c64a01ce1354ae663490e7fa5e6b1e9035ffbf33c6"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.4/agentrec_0.15.4_linux_amd64.tar.gz"
      sha256 "c6ee57aad11ed63e5beb715a1922070a9600721f8129fa8aa3f8d3b1e475a7ff"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.15.4", shell_output("#{bin}/agentrec version")
  end
end
