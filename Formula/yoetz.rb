# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.43"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.43/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "ac1315d50e470e00a5e032674e03790fabdb5c1f25dfea6a3c2fd9847b288291"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.43/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "ba557c47d3e96befa0b8fd25dde9083a99b3e9fa690606f368cc16071f5c42b4"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.43/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "818f3566f1b0df74b28c4990f2325c80e06feb9e782ccfdf550d736b10a832d8"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.43/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "82a31c3124bfd94b45fde2601b4d507a8b4ea3ec050b09ba6dccacd14343d784"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.43/yoetz-chatgpt-native-extension-0.5.43.zip"
    sha256 "4e0fbd256f8a494192ae5a8d3ea627d6622a5d750510c8be179b52d29aaa1dbb"
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
