# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.0"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.0/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "81b5e2a86789cabef31a0e62b42a6e77a02a60a1a09f17018c1b628bb298b17a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.0/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "6952977b5dc7a849d1f27e98aae085596053237f41b9e3cfa2bfc9e21f43f9b7"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.0/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "44339610545197792a9a012f5f72e398129fba34d406197f6d00bd0877db9145"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.0/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c66db19691913bee38374c5f4fc110e05451f0ac8622a65ee9090890b7a691e1"
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
