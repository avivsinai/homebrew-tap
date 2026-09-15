# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.77"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.77/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "6c3a14f115b2782d5e2d398945d950a3504f25d750742a5d1178dbb27e2a09c9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.77/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "8b384ba4c1492a6425570ba00969d6b9e0f3f5c482647fe5153376fcbb232e44"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.77/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3c362ff8a67fb715ba3188060706f5fac109b39e8368c1b2a200b07f737b9d9d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.77/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "69211a3d63003e85b2d711eeeec528b6bb8d0b7fce8275b922594223af1b4019"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.77/yoetz-chatgpt-native-extension-0.5.77.zip"
    sha256 "e7e946cfd0038ed6502e73f3a38ca625dfe85524e9c38363cb987f8f62724273"
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
