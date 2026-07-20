# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.39"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.39/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "6137e7517113eaeab88e5aaba3b09f672a1f039de90b8366e158a46d982dc5e2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.39/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "ff2e808b87a73e2a942347562eb0257dba819844b33ac79ec27f4cd72d454133"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.39/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d5502d0bf69419424dd2bbaa81b2ec860b2207423c718bb2201d0d329e10b3bf"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.39/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "83d5b740b6110543ecbe6cb04b49b44b36356b2c994ebd18d353556b912370df"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.39/yoetz-chatgpt-native-extension-0.5.39.zip"
    sha256 "34b1da4fde12adbafd9315dbbfd2ee9083efa1d4a1cce3b5c4c6b2647c66fe18"
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
