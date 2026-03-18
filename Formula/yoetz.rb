# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.18"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.18/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "b0342bfa855fa044ed7e9a2f0c8f30c72a07a9a9aafe94f1355fe302d5e1185b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.18/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "2391650989f4a7790ab4910cb0ae5742b93b3ebc552f635416b2cf5b7cced697"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.18/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "300cc212b6a7adb982b6e3aa3ccb2361c06295b2449685c8c962c5f2e48f8719"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.18/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "31c95cebc465676320426e5de9288eccd3a86b5dadf1cd56869dec0e0e424db4"
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
