# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.51"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.51/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "f5755377795738961344fd5fd26b7ecf17b6557a8a5baf0cb5c709c700604f35"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.51/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "479fc98cdbbf23200dfa3ce3f0dfd58cdc00fbf446493417963a74c681012b7d"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.51/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9289d6c3844aa011a1e0baca66c82655436fc56f16fe67207cf53280b4e45ce6"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.51/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8b356f5f51b7f1e741a63b4d1910daac823a17650364e1883331c42416d38f32"
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
