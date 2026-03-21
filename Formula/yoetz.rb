# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.20"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.20/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "6da76af05b8f32aecd6b6f01577092e6054b35fa02e45e051c4bf4b8b46c28bc"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.20/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "45ef054d70579c152495646b7527c0094c974f925221b75434a057fb80f3fa79"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.20/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0b29795471b0b701538c563c29de23bf1c1861ec81754a9310663774e2f60eae"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.20/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ce26ed12aee409e88c6c6959c4258a66efc393c6f47fc7bfb2f75a21425f373f"
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
