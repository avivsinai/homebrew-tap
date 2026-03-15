# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.13"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.13/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "1577c908b2f0fb29bdf1580455acaf44a4fc741dd51783008f3625a77a6ca3e3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.13/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "4aea6f8f81ea93009d7b789fb5c47212baea7c24ea1cd86a2036019fcd41ffae"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.13/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1ffd4aef82f5e090b31817757fb0c56c53cb391ce1caf1c7a63690861866bdaa"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.13/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9e2f6f3c8e3789d1e6be00de74574fa7fdb7e4a2dee68094c7c66c908c730fd6"
    end
  end

  def install
    bin.install "yoetz"
    (share/"yoetz").install "scripts", "recipes"
  end

  test do
    system "#{bin}/yoetz", "--version"
  end
end
