# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.50"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.50/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "ba789ee62df2d851080b0810cd3138b8e0428d07361eaf6cb1b979b7fac879b5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.50/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "837cd07c611c3d8a5c6668b7520bae2336f068751ec9bb4db34f6daabb5f9fd0"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.50/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "330afa2ddfea0b0e1fecfa8f27e95dbb310d4177ab707c3b39f9775f6acf0b8b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.50/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "360a0be1e8fa358460eb389185159b39b0aac3985f0e46f7e2d10fa02fb21f5b"
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
