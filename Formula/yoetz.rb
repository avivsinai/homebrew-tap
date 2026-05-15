# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.9"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.9/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "68323491bbe0cfe4e0fcb41c07c3c07d859e27d52dc1554e22ca94767fa8ecb3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.9/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "17edae60f4f55045259365038a7fc4c703204bf82d0377a3fe23d1215fc36384"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.9/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "97216e019cf58fd385dc5ec45857c048d26533f7f9a6d4798ee397b117f0f525"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.9/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d76f94fa9a7b9c7e3c5b0d9fa705219c8723bc890eb1076dbc552d02abfc8646"
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
