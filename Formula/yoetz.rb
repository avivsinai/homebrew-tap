# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.11"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.11/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "2f75d808fac4ccc5a638f736db5c29725e1ef30ab8d464384700db2c19120548"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.11/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "ece0b8a9615decc32c028174b1595f8d65f7d200dd8c17099a792256a7a2f067"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.11/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "405873ff62c1e562865aa15112144af99134d6667a3cd9c607bc6265a0cac5bf"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.11/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c287774fe95fa7198ace9d32763b0e11af2f7ce2ccc41c66de7d043948589a16"
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
