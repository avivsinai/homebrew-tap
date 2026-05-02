# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.57"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.57/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "f7a8d66d468e567a7f3e0ee79c1896c6328adffad795a9eb497700b9dc96e4a8"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.57/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "e9265c1de19c43719b1e7c7a1d46ffa4605663e483bafd7ae76e2bb65758ad1e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.57/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f27072fc0a1bf8d9136e2c20202a82382889aa1fa11b01b1532580ed57127490"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.57/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f1673ed5bf0505fd6c37e8c5744996656004b3ab7c43c988ac08a6425859b4e4"
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
