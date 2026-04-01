# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.42"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.42/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "223a30f16f6e2d931df8bb8a56537f48298b407ffb60b83373b7617c42b287ce"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.42/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "b4f3aff5cefd97e84cb032c28282ca0c6f5d848ca59324db5c5d314a826ce160"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.42/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3e3e5e809cd6b4733d448c6822871b140fc3e265f310a0a713a45c5d77d6e7fe"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.42/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7e653f1811693076417b9d7d3c741c46d07023d7a1a2aa6a1b9cb86acc233216"
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
