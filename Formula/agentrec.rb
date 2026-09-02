class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.4.0/agentrec_0.4.0_darwin_arm64.tar.gz"
      sha256 "51f4457805840b212abb040f537d665bc2d7a0592c2c94df80ec5c2389263bac"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.4.0/agentrec_0.4.0_darwin_amd64.tar.gz"
      sha256 "f45b45fe2ccd36e5a557f713c69365aa3bd953c197153eb95640b904c2c284ae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.4.0/agentrec_0.4.0_linux_arm64.tar.gz"
      sha256 "d4463114e0f273d5530ae964da6da17349a26777e80c0609316a0df02ba3b492"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.4.0/agentrec_0.4.0_linux_amd64.tar.gz"
      sha256 "17d5d6e0b8b0f2e65b42cb549701f24f6c95b9492f8cd078735aa728d6ee3773"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.4.0", shell_output("#{bin}/agentrec version")
  end
end
