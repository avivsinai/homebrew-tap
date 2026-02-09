# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.1/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "7cca4b41bc69b45b41b16011df85fa27631aaf8e97c44274dcb6d8d8024de316"

      def install
        bin.install "yoetz"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.1/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "0713350cc2f1f529d86c70ce7a74e63dc2c4df0f69704cddbad07682ccf72f69"

      def install
        bin.install "yoetz"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.1/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f103af2881a33881c3e086986e442896853bbfe3f65a7afec2adae46ded64ce9"

      def install
        bin.install "yoetz"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.1/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7f92c2f84d9b32a1455aafc795715a76ae28ab93c37e44c692a90de1d1267d69"

      def install
        bin.install "yoetz"
      end
    end
  end

  test do
    system "#{bin}/yoetz", "--version"
  end
end
