class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.7/agentrec_0.15.7_darwin_arm64.tar.gz"
      sha256 "3ce031084a6bc75c7468780f2fc25feba8223720f69cdd452505183dea93da3a"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.7/agentrec_0.15.7_darwin_amd64.tar.gz"
      sha256 "f329ae21baa4d54e327b5fba7e6f584201ec2617b5d138c70724314000b47afd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.7/agentrec_0.15.7_linux_arm64.tar.gz"
      sha256 "5d32a751d0eb4755db1536a451ad6783b49f4cb9d27d7d942c1479009cf72370"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.7/agentrec_0.15.7_linux_amd64.tar.gz"
      sha256 "71dcb3eba48e0913342fa7ec15e2b4a4356d08efced82d836bbc76f43543afeb"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.15.7", shell_output("#{bin}/agentrec version")
  end
end
