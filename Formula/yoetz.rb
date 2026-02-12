# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.3/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "bc3871997d04445916946a44df312301086b1b19aac250c3d6508822ccac8dd8"

      def install
        bin.install "yoetz"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.3/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "9008bf12bcb668085330b607dceb474ac137fc00cb64157f24331d99bed41e41"

      def install
        bin.install "yoetz"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.3/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0728978d60897ac3f9ec45e0405eb726b7b5de98b94605f3e4017f146a7dde03"

      def install
        bin.install "yoetz"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.3/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b10ed32eac504a431264c7b914fc81d3e70884a5c5c1859007db9dd01f4226fe"

      def install
        bin.install "yoetz"
      end
    end
  end

  test do
    system "#{bin}/yoetz", "--version"
  end
end
