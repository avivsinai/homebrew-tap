# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.41"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.41/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "ad7077989923ca5f5e45e027cd4c564beb8dfd0a613ba382b52e97dddb0e97ae"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.41/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "f7eb29de6194548249ee34d7cc6c864dd7dbb61c8e7fe23078243e09e8145c75"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.41/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d036d09bb05c2eaa9bc77c4fcf130733721b2e9d6cc0ac9b34d8e4d9fbd501a2"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.41/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ffa92a26ccdc359cec88493966e33adf1cf655b0731d98dd94d1fa3ae1418791"
    end
  end

  def install
    bin.install "yoetz"
    (share/"yoetz").install "scripts", "recipes"
  end

  test do
    system "#{bin}/yoetz", "--version"
  end
end
