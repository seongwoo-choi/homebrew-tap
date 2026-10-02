class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.18.0/agentrec_0.18.0_darwin_arm64.tar.gz"
      sha256 "a9a9d5a7fc464d612f2cae88137f1ef9bfb88837a39ebba076ba8165202aa735"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.18.0/agentrec_0.18.0_darwin_amd64.tar.gz"
      sha256 "c69667ee3e24eba59ed6fb298fcd600c8ffee60012545bd9dc1d3339597664aa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.18.0/agentrec_0.18.0_linux_arm64.tar.gz"
      sha256 "bbcb29a479ebb26bf392d7ea8e57851e18b6646c67f22216158a6970eaa9e36a"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.18.0/agentrec_0.18.0_linux_amd64.tar.gz"
      sha256 "6e50f268809452118668099ea39328a269c132206b03cefd85ed949196f416f8"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.18.0", shell_output("#{bin}/agentrec version")
  end
end
