# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.76"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.76/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "37a3236b6053270ed0a6f34c2cb07d0c0254ddf51b8a92dff213ce27fd050c50"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.76/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "8bd3268f263633ec66930abb2aefe98d5b206ac1e2d6e11e2445ebc4545b7495"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.76/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d8f7cdffd14c1090fadc4070c2418ef3a3e73b705fc16dae6e01ac50ad87c0e4"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.76/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3ea7161a00bd4ed5bee24f8762fbae6ee1483a3f7d4b11cdc97d2c4bdc0e32fe"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.76/yoetz-chatgpt-native-extension-0.5.76.zip"
    sha256 "62f0eab455dde21fd1af00e4a2784c6aaec0b3f918f9b58be0b31173e7eebbaa"
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
