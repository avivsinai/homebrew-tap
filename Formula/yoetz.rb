# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.97"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.97/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "cdf1f68ca4b8d653f52f3bee288d6b07cf38b8a598a7ba17f1faf50b8da81d0a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.97/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "a150a8be124205e2b822f7eccf30feccd6da8a030004504b8682dfd17b789af7"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.97/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b97f53b35d2b6ceea43109ca2e7509dbbd43f94bacc090bf6583acba8246ee55"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.97/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "617cd3f389c13645005dda932afca2e1252b091f049c307dd00c7eb70c34dfb8"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.97/yoetz-chatgpt-native-extension-0.5.97.zip"
    sha256 "a9b167ec921fc3690ff8ef1865b0da3cad2053bb336dc702ecb02e1918896643"
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
