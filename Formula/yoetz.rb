# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.60"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.60/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "690b8aef7bbdeac9d7aa87231e2fcc8a09beb1a0b7abfb75623f2712b403c88b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.60/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "24f30df4b1357f0c7790265c35340e1cb3e7092016d3bb860eaf9cac8f4038d8"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.60/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1bfebea41295569411874612983c54a6d41b03e0cc5d840197768930fccdd1ea"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.60/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4b2a4e015df8a992d57ffc564f2e6e9cdb7591ee60386966fe982119ae5bea9c"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.60/yoetz-chatgpt-native-extension-0.5.60.zip"
    sha256 "2b598b54168bdc10653f431a7deab70f8fd7d52a31129a138be33f8aa962ba25"
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
