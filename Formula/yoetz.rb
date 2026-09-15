# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.75"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.75/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "fd96564e2e11c9b55e944a51b0b04ba22036bbbba33c4ed3544576a5966b8e9a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.75/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "f896fb7451b13057698f01b917cf5f87b59adfe7e8e17181b26feca37e90d9c5"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.75/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bd0d41055cc426727bba7e936d2f3b6467dff7e941833d5f6e7526270d45683f"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.75/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cce5a8d6ae09847826359202dbf9c741d076fc14092984d4b56a31346f5c7209"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.75/yoetz-chatgpt-native-extension-0.5.75.zip"
    sha256 "63572e3dbdb8363270fb0d4c43418b9b87fecb582e2fec229b46603f1845c813"
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
