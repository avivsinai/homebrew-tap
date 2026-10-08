# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.85"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.85/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "4c6b23d99e324f155401334a5d0e2ae611fed3ff84a39e70b89cfe068c4c4845"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.85/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "ef0305c3d97f8c55a2459fafe790fef5e5b7f9cb8a0c5698b91e1c814abb5754"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.85/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0934d057786094503c99d37a41f745a4b918fc903d9de1f39bee31d6831777c8"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.85/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2520b11775a63655f4391b00bfabaa977088420246b2160b8fdba37e110384b9"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.85/yoetz-chatgpt-native-extension-0.5.85.zip"
    sha256 "6fc5e34525bf551fa9677da9370a3e7eb8a172b3253f3100a005379afcfbca8d"
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
