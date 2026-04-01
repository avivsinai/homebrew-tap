# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.43"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.43/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "5c79cba147648e6ae5445727d6f1458a852af95d20efb2747e4f4f7c45745694"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.43/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "e9c73cad7a1532d7e456d2434d2b3a27e6c3af1041e2e96c73591c3ea8e2dcaf"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.43/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "11fd09c7f3a297ee92250c1e850519fdb6f3d73dbd536eafe96ebc209090903a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.43/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2ecc85c5b3e6262f3fb134f7bfc22d1f2bf7e2569d6cd82741004b9a9df5ed5e"
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
