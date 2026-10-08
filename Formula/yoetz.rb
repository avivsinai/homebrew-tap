# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.86"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.86/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "5b5afdafca0d9c7cb029e7471ebfaaebda67556b43e477127833cbcbf87eba58"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.86/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "c2d07b72ca4b4c4bc4bd0c6e82df15220d6448ee291a970250c259e0183f7ebc"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.86/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9904b52962d81a74ac9f4b545afd58d444bab599212aecac1e6b27a8070c58db"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.86/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "26f77d78c80c26360922ad329c17d4b878e08f349557e69d1ffb7c4084cf4ca3"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.86/yoetz-chatgpt-native-extension-0.5.86.zip"
    sha256 "b6c6797ea0c8794edd0e4725cbc232a7e03eb33444214047763f87b46d41f068"
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
