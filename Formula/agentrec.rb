class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.6/agentrec_0.15.6_darwin_arm64.tar.gz"
      sha256 "7298325ca96bf1d52e5855213c89520fa94093a5185e5bff8e8ee3c882d2dd64"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.6/agentrec_0.15.6_darwin_amd64.tar.gz"
      sha256 "3a1fd6eb8bc2a3e865779f33a781157990caaa87693df8a541ac7ff1a9d53e6d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.6/agentrec_0.15.6_linux_arm64.tar.gz"
      sha256 "31454edc013200b7d459b462b536f5bc51503e27c430ed2cfeb7b7e6ce792958"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.15.6/agentrec_0.15.6_linux_amd64.tar.gz"
      sha256 "8ef3bbd8652f2c3cb62bbd4bb15cbd92e9d0be617eace65c698380c2e1f9c863"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.15.6", shell_output("#{bin}/agentrec version")
  end
end
