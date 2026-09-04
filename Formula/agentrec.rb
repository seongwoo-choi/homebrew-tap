class Agentrec < Formula
  desc "Local flight recorder for Claude Code and Codex runs"
  homepage "https://github.com/seongwoo-choi/agentrec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.7.1/agentrec_0.7.1_darwin_arm64.tar.gz"
      sha256 "b165c0711599b6bdf7360bf38bbeaf99a491e40bec3e44eb46ecb63faa1b73e5"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.7.1/agentrec_0.7.1_darwin_amd64.tar.gz"
      sha256 "b8b93a42ced90f45d1b98f7dfdb0bcd9430dabf6fe85515a6038e8035160de57"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.7.1/agentrec_0.7.1_linux_arm64.tar.gz"
      sha256 "e167719ab91390151c17a52272936d5cdb7d576c1bcd94fff5362390774c0374"
    else
      url "https://github.com/seongwoo-choi/agentrec/releases/download/v0.7.1/agentrec_0.7.1_linux_amd64.tar.gz"
      sha256 "ad9ef593ae0e05df799ea2c0931d1b45ff3e1d8a03987408472b050f1baa84b5"
    end
  end

  def install
    bin.install "agentrec"
  end

  test do
    assert_match "agentrec v0.7.1", shell_output("#{bin}/agentrec version")
  end
end
