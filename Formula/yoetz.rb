# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.3.0"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.3.0/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "ffbbb62bdaaed95a98e5941ac5451a85e9e21eb0679b43266c20484adee88776"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.3.0/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "33e9699b8cb72cc085e49f3f41994d9010b7575479d25429e43205e8945a9684"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.3.0/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "68a8e2cf6c4e6ec763f103da84b167752b67d1e0feeb3ce0439104e33ebfade2"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.3.0/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3f0b8acac5899c728cd162ba78a252ec5d94f579aba2991e4fe006ab1af0d335"
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
