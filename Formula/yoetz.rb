# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.26"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.26/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "725fd612c5de519f6b120f3531a2b1608e7c74083fe4b027ec1c9320ed88d661"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.26/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "215b17a6b365f3ab6dad63417955cf8f8a8e9213f849d8696580ed98c9cc9bd4"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.26/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "17e8dd5fadef393287286e12feb1c7d6410b3a8abc3d0d8c0155f1a56f6ac113"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.26/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d5df403d2eca1430e56934f8f76368148a5c7fa9044de52997b56304fe7034ae"
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
