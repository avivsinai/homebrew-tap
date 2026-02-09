# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.2/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "871ed029f7ad32426fc627715bbdde4a72fdce178f98012211c5556315abb279"

      def install
        bin.install "yoetz"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.2/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "bcb6c9494bde321fbe9358d3ec7bdcdb07c0ab63e819a338c80eb57547083d31"

      def install
        bin.install "yoetz"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.2/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2d243ebd2fec72c24e5546b1df2b90fa8df048761971cf6e3d90788198c555bb"

      def install
        bin.install "yoetz"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.2/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "314234d145e0890935b6ee21a2b7847e0309dcec87bb8d1d64d5581216e123c8"

      def install
        bin.install "yoetz"
      end
    end
  end

  test do
    system "#{bin}/yoetz", "--version"
  end
end
