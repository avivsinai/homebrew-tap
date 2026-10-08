# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.87"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.87/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "56983e1b356fae50a394bcc1d503d262835b28db64782434dcfe90ab3a7ff99b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.87/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "73e48fb8121f6222d62f4ef793817022309226e1b41d15ee5880afa284b03ad8"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.87/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "06a8a4428257b43867af3bec0fd161466264591c0838ad74da1b040e8e4c4fd2"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.87/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "91c51d09c60c0ac13f5d418e9596dfce5d41302960dca3b4a4b2ad4c3cc34464"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.87/yoetz-chatgpt-native-extension-0.5.87.zip"
    sha256 "66950a27267e8bb2b26e696ad832e1100748ad2922251ceddf921d83db7c74bc"
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
