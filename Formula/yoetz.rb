# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.90"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.90/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "bb316c55ce2f640ef6001095b0e65bf015647b565e0c68c055726787a35e6ffc"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.90/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "3cd039ec7230c9bd2a2bc9686afaef79abd69dc1a8c5db433d9ae1dca4ac1048"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.90/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7434d80eda60494db71a702b57a03f491f6fe2f101c7bdc33c659ded7842cb2b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.90/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5d26fbfb4f6b0e248e6f8194f9fe22cd1b5d663797cde649b4fef1f1fecc566b"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.90/yoetz-chatgpt-native-extension-0.5.90.zip"
    sha256 "29be79d6e8a16eeeda8233994125c18581f0cf364d1a543f2c890a5b2dcb570a"
  end

  def install
    bin.install "yoetz"
    (share/"yoetz").install "scripts", "recipes"
    resource("chatgpt_native_extension").stage do
      (share/"yoetz/extensions/chatgpt-native").install Dir["*"]
    end
  end

  test do
    system "#{bin}/yoetz", "--version"
  end
end
