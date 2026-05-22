# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.13"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.13/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "bc8440b925b27e3b620c45f88b6819a85c109654522fe7cc7c2fe499d176e9ae"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.13/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "ef25f7c436a725656625c619a0c5136ea134be8e12f2706ed282343bcc55be5c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.13/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "75d136aa060e5479bcf328c435b696de660e716ff9f186530c484ed42bdd1ee0"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.13/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eeb46493366a4e21b6b90e7e739dc8987065a21e1a6197b0711ffc8a91c549fa"
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
