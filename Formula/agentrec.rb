class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.17.0/agentrec_0.17.0_darwin_arm64.tar.gz"
      sha256 "bbaae3c6bbe034725cdf5dc7c7203cdc9755b2ae2413eb1db7824a1394e859ca"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.17.0/agentrec_0.17.0_darwin_amd64.tar.gz"
      sha256 "fdfa71f43d6e21aae8f44f7bca98c8d13fc8a16c1458ffbe8cb2623323596dde"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.17.0/agentrec_0.17.0_linux_arm64.tar.gz"
      sha256 "4a7f50845a6b993a73471d4174c2c6c088dadde6f2c332f6d2ae0a30878e977d"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.17.0/agentrec_0.17.0_linux_amd64.tar.gz"
      sha256 "cf52771c6d94e6481892782f21af7c50ab066b6f1578ff0fb852545fc2c91309"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.17.0", shell_output("#{bin}/agentrec version")
  end
end
