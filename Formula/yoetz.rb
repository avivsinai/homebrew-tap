# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.5/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "cb5cc5e008776cb056ab4c43ffd12115610f6ba569756b913517e88c0f542d3a"

      def install
        bin.install "yoetz"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.5/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "2c37080f22d8ccdbf75d5bdfdc8348add4cd196804aee2e282c65c4a48bf6258"

      def install
        bin.install "yoetz"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.5/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b8744dfad0914ad9de04b305734a8ac5b486da5025ed2c0592eb45ac18567d9c"

      def install
        bin.install "yoetz"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.5/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "299d9c8b23b31e8c4b0e34f45d746082fd136620cab227d444409f688679f45d"

      def install
        bin.install "yoetz"
      end
    end
  end

  test do
    system "#{bin}/yoetz", "--version"
  end
end
