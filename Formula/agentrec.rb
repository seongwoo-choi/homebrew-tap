class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.19.0/agentrec_0.19.0_darwin_arm64.tar.gz"
      sha256 "511ade26b8db603e67af6396a914e1ea428201f6109bc990c19f8846f1a1a4ec"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.19.0/agentrec_0.19.0_darwin_amd64.tar.gz"
      sha256 "797000d5834950f6600e6c61db41ae2124e4dfd6e027f4666d018f6c6b42c80e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.19.0/agentrec_0.19.0_linux_arm64.tar.gz"
      sha256 "7cba17c598ef4cc05435e0e80810f6c683064e7b5f0800feb58a2d0b0d0d8ef5"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.19.0/agentrec_0.19.0_linux_amd64.tar.gz"
      sha256 "7ded944f294d7d7989c5a510ff3989ea6bffba6328ba9ff704a0ed43de8c3d59"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.19.0", shell_output("#{bin}/agentrec version")
  end
end
