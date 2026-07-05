# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.30"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.30/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "108604a9591675478fce234bae5c2da9a25ef9f461033aabea0a90fedc3fb49c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.30/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "e0e216b8fdc9f1fc647ae49c1f2f0c5a0aa2e651ee1ee41da5ea50e60843e0d8"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.30/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aad4a34180e1fde1c3b42460aefece241d90b38b699cec6cf9b21bc596775449"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.30/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3e327b4288bc3672f7722e270c7e6f6cc6b795c304b7f3fee422a1a9af1afa8c"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.30/yoetz-chatgpt-native-extension-0.5.30.zip"
    sha256 "5c3a4ecc06fe9d2cf82882e7fbc414401110741c83abfda8aa069a95483b4aaf"
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
