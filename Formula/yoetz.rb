# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.45"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.45/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "50cf7d96d569df7db3ce0ce67cf8224a74f06f9662dd345ffdab9db2e792c4e6"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.45/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "4bbd3cb936cf863e9c12025c9385368b1c10cc6d85683b3e9fdbf4538059156c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.45/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "94de199db06d8b78eceb2b2cce1b327894abbfec030c6850096785425de11379"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.45/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "276e5c5fce65b188d9e18bf1c237afa516f2f846e3bec3c525e537f0309c6755"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.45/yoetz-chatgpt-native-extension-0.5.45.zip"
    sha256 "efa06de656d47cde901311dd487894d66fdc20e333d7174447ef9e7a410dd7fa"
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
