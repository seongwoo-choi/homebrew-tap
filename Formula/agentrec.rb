class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.13.0/agentrec_0.13.0_darwin_arm64.tar.gz"
      sha256 "46e25768b5235adc6e7b049acfd186fb3e86046abe741cdc93f550973a24e54a"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.13.0/agentrec_0.13.0_darwin_amd64.tar.gz"
      sha256 "2d94f7e7369fa163fbcc839d9f0ca551eca3ee4d00623762d290f96e448428a7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.13.0/agentrec_0.13.0_linux_arm64.tar.gz"
      sha256 "2b20d215137b1f676bb7f37d4198022c5896a0cd160f2933c501a66dee3b7a41"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.13.0/agentrec_0.13.0_linux_amd64.tar.gz"
      sha256 "b5ea19903127eabbf22a5194514aaa3eba74803c828aba1a03b6c4790c858731"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.13.0", shell_output("#{bin}/agentrec version")
  end
end
