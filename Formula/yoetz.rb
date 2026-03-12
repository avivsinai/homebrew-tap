# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.7/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "291889154e942bd1ada0006a5d85b41d201906c72b63252eaa4c16f55b126dde"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.7/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "37f6180de632477ed66282a444da3bed32c0c933e1a454cc5f59106a8ca57a55"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.7/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2120ebd279f5187b469ea1c7636a8c533d2a0ce5483d0a6a4012a0555392c157"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.7/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1520fe4db886ccd30549556642a99659fd1daa105eb48baea6854215da97c491"
    end
  end

  def install
    bin.install "yoetz"
    (share/"yoetz/scripts").install Dir["scripts/*"]
    (share/"yoetz/recipes").install Dir["recipes/*"]
  end

  test do
    system "#{bin}/yoetz", "--version"
  end
end
