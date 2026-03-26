# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.32"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.32/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "801923bd68248c3c0d9669c569ba38914fdf78fbe0c9b60d5971687bfda1fe1b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.32/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "3c75de4b2d14fee813a558a709e78cd9d33f63aad0332a92b89084863127693c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.32/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "412e3f4ffa8835875c742cb96d763366ec0addb096eb953f086b9e431dbd7cf4"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.32/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "68beb46f2aa4db278f3931b42068d687c40a500977f5260d8597591d26b3751c"
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
