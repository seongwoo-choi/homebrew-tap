class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.1.0/agentrec_0.1.0_darwin_arm64.tar.gz"
      sha256 "1f3ba3cd2846391fe22f489e52eef2bd5e05718c5176c9017677de2147146074"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.1.0/agentrec_0.1.0_darwin_amd64.tar.gz"
      sha256 "4cecaf6988c50443236f5f354af9adde5a39f2f7684caca44a072454cd26eb2d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.1.0/agentrec_0.1.0_linux_arm64.tar.gz"
      sha256 "85d525b6308817fe1afec504e259574bbea4307f836c6c16c361730cd3dd32ef"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.1.0/agentrec_0.1.0_linux_amd64.tar.gz"
      sha256 "927973a6a9f454c23b964166a6ae6597408b02c4bd92c76079d81cfee233bba4"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.1.0", shell_output("#{bin}/agentrec version")
  end
end
