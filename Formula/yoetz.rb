# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.65"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.65/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "b37e56142446b4d64f26d275e03fca14583af4d766f53e45efcd02e049939833"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.65/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "74304681eaa23edf22104db6b02a61b52b056cc09f09a3c27b20212dfa7a3bb3"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.65/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9ccdeac643c79f1b6d4e76c01c504f0b914a7885ffdebdececa7cf491ecc3e4e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.65/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "94d26112831f7f19f66d5196ed2767cfc58c02d9e14bfad262dd7ecb2609a6d5"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.65/yoetz-chatgpt-native-extension-0.5.65.zip"
    sha256 "cbfdbc7a35e46a8da1a519b73ac0b8586678eae8ef7bcca2f4ef15da17d38401"
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
