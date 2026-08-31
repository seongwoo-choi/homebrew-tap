class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.2.0/agentrec_0.2.0_darwin_arm64.tar.gz"
      sha256 "d48c5b54cd935ce55c3fada27a7276e6052b2595fa9050bb212dbf5987ee5e52"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.2.0/agentrec_0.2.0_darwin_amd64.tar.gz"
      sha256 "9cfd5659c83f82ea43a2484c1caba7bf93edf8ee2737a78035b26cd8680cb726"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.2.0/agentrec_0.2.0_linux_arm64.tar.gz"
      sha256 "dc9ce828085efeea7180f53debf13ebb7362ba04191ec7c167ada7ae479788f6"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.2.0/agentrec_0.2.0_linux_amd64.tar.gz"
      sha256 "a625b59508520905881e66b192eaadd525130bc0994d195ed4d1e76c3bdc9013"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.2.0", shell_output("#{bin}/agentrec version")
  end
end
