# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.34"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.34/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "fd86b6437f5c0a42d614611e0d2ecc9a762d4791711ea377b41a68c7cc1fa3dc"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.34/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "2ff4b41df758fb116d63ca71e6f314abdef512749ed7650cec318e0c3c63bd31"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.34/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b5f9e2eb5e5731673f0268e0fa8fa99d60bdba0ee199d1385defb309d039721b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.34/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0af834eaa25f66bff8b7c8498504fcefa3ba520a66a2644035ed1193093307a0"
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
