# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.52"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.52/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "8ae2cb1cf2d582fd8feb1e5bfc9092b94354d09c3edb3d822311e3a5ef2f8624"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.52/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "fbf442119169b16b868d121cb67b9d7b7a14849df8466e9ad6cdac1bf11c6bd7"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.52/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cc34bff841826debebb730e7f3db12857796251dae6094f86329364e5d32482e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.52/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "470f599a3bf48291f0710bfb72d8faef31a626441011d07d7b20f1b08241fd09"
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
