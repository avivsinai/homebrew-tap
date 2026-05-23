# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.14"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.14/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "f85cc2c76d3d563764c7d4f48a89c4f2e3c9e9ced35c43ab08b0c57727725996"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.14/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "db40a04cba87984bb5b3c7471dce611e73f75fd6441061209ceb86a8310c9395"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.14/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d1c74a5ad53588ee1715542038f72416145c3b3974d82180a55ebaa4a88f4e91"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.14/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "37859847bb6b223162cc36c60b92a5dab63e7072b26d5270819ddd28b0bcd5a4"
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
