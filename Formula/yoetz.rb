# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.55"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.55/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "288de54a02864fe168a5131a58da113729f5592354978796231001aec5214d9e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.55/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "120066b7b4d2349c59bc97a55242cabfad4be9b967f1b2287ee8590c7ae9299d"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.55/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6c0aff881424d3711f274dc5dbbda047bccafdb7ffb61aa8b1092ecad6c95fea"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.55/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "34145718c5cb0c9269e417bf971166f32aa9bfe140cbbe6bf644bb1727e50dda"
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
