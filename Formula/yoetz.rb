# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.1"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.1/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "50035f1e8f997c89de80953426d6b6b8ccdec7097edfa185becc6f58720ac166"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.1/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "04d08e118e8a58f53b81f2f843b3398a1b1e8b6e9c03239a285ba175ce92ddfd"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.1/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f461f440ee3b9e7ee1fe19ec22f4804b40dfdbf15ba36d83c5c2a15022e4444b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.1/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9300810c7d6a5a0a90a6371ce61e958dce83d0d7fc1dd1a8bc6ae85f772981a1"
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
