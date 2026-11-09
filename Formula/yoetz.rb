# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.98"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.98/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "8befe55a4dd37b4a81d790e4b80078bc56917594a64d517ab776fb177e5fcfc4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.98/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "46943fcdd8a4fa778e80607a227fd5e7b32c9163ec22fd097bcba4b9990a3b7a"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.98/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fb0fc90a11fd47c2d17b05fdbabc049bd9767994941988e79d79a99f38122df6"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.98/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5548bb3122a5864e75d37616e4edfc0d2e83a700b13bb5c565d19cc14724a406"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.98/yoetz-chatgpt-native-extension-0.5.98.zip"
    sha256 "cb3c1c47c838d20cf04b0ac5c14c9716f88e0160e627da0f430ce91a8982c5f8"
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
