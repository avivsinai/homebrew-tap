# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.0/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "c20052de586853769100e2ddd197f27e607376cbee9c726d6620e197422f5532"

      def install
        bin.install "yoetz"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.0/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "b5e555abfbb8f848e64d81fc66493ed2fb5b9444a3f5c0f38068f4d498c285d7"

      def install
        bin.install "yoetz"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.0/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "17596bc2e5ce493258b6e1d538f3109e1570e029428dc384856c543af8134d6f"

      def install
        bin.install "yoetz"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.0/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6a3755b6b8089da866ac17ad00a1419f5ffeeb005f028210bd9e384c11b11390"

      def install
        bin.install "yoetz"
      end
    end
  end

  test do
    system "#{bin}/yoetz", "--version"
  end
end
