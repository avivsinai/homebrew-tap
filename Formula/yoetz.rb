# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.4.0"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.4.0/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "9e75f2cbb46e3d12ebc5ec6a5e6b63bcdd891533e606c2460041ca72369773c9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.4.0/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "c7c90352c045f6f2792d9fea810ef973dbebb1bcbb484ca7d5fa4982a5c70ad4"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.4.0/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6a0c95ae519866bac0fc09cfda26fbadeb90392ba133d701db39ccfe61ce2053"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.4.0/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b58d5ee78efea344e5b3b6ec806ee205c72f5a227f03d7a3ef6c5e3712f04da7"
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
