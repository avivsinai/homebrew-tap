# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.19"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.19/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "f35e5713236882607f364699a6980fc69d1ef978877387e3460bb6b2a7c68375"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.19/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "d8e1043e07022a42c4efc05fa0946ae582c201d7a1c9afa88be5fdda3d246682"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.19/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5189bd21afc39f42b7ffba095e9e94e9af6111edbaca2da91a84d4813c4a1789"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.19/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0395068963751a6a18e6bd67a9be19f5260857ab6733e790da40c0dd439f8ba0"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.19/yoetz-chatgpt-native-extension-0.5.19.zip"
    sha256 "e0a9bba64b17b8400f3717fc0a466b7f9dce772620e9bd2abe0da7664b1d5762"
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
