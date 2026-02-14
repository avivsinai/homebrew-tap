# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.4/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "941a000c00702acd8ae86a6fcb49bc421aab6f2802f3a22d20974c5dd7817aaf"

      def install
        bin.install "yoetz"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.4/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "b6a02b43f612c2c99d42a2c5c640fdef71083d1f9cd0f278de505a185842a9a7"

      def install
        bin.install "yoetz"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.4/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e3af0acb88b333b140fbb2e04b0e81a20501b478fb97e0d63313c6790065ba6c"

      def install
        bin.install "yoetz"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.4/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "18b7c4821c5ef440e385badc9ef0a9214cd297162b46cd51c1c07438888a8547"

      def install
        bin.install "yoetz"
      end
    end
  end

  test do
    system "#{bin}/yoetz", "--version"
  end
end
