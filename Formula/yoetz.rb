# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.12"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.12/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "076012e95576858a0f0bf2e1df5b9daeee768a980a5ba8e3c67ed9567e011063"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.12/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "c752f5fb2247667ba56b77cdfc0fa0d407f2b3c6f4676e55dee48a2428c3ff31"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.12/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9b635592b88d00e65e4a4a5c879c280175cf1c7f2cb9e3385f0b8c306ff29903"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.12/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5eefbdec070b8fcb3e87c10d12de7445187313bfbd39f2d6b8c9a7908afe77cb"
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
