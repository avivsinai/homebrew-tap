# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.21"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.21/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "438b5c3ee01907d6f12be8ef1e02c5b1fbad0d33ed2624b87ad556580a12a7f2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.21/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "edc07281cd609abd055c6b676e98d37f7130b66aef0abc1288a629e7090777da"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.21/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d7aa99ca354968fa2c0c6b3003217760eb106ea13a7b7e507f3f9c929640c638"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.21/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5629df1d8cf7540796a37efca259ef0568c4e0c6bbf593737e7f37c4da93fd22"
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
