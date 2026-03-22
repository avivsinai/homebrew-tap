# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.22"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.22/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "032a776dc2ccd9076941f41965c254ce6ff06c91b25434c16dc60d4901cf89b1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.22/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "9bcaf9070911e8e41b0d0257af0a0333b5da98e07ca759b3723e2caba1cbccdb"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.22/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d69033731437b1491ea5d9581923516a9adafe07daded04ee5c15c4f80479f33"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.22/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0f8c62c20447e83cdde3ff3a73652440cd9eb308f20fbd67abd11c0c0f0fb6b6"
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
