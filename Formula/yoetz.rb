# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.6"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.6/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "b193fbc29f778c45c21e47907e34c4b46fd39386eb8827b37e5e36fd9fd7042a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.6/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "d87f2bc17a7e4abe0950f79ea272e6dddd5a8a4e902cc23eb9f232b80a60f2c4"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.6/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "56413255a114e28e5f64d95a57e6ad21e01712138c5fd2fa84e02a8dcb700bc9"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.6/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "936e74cd2fa167f8c46b7c3ff70979a0b0823892d95954226007dce03b838fb4"
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
