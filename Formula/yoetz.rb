# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.1.0/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "086f6eb8c42b6f280e1b8575749f9623d8a45150b87ccdd897c93d195562b011"

      def install
        bin.install "yoetz"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.1.0/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "c32828c3bb9b1d2185f115db0918d529e48a558f5ec8bb473dcd0d431fd4b63c"

      def install
        bin.install "yoetz"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.1.0/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ec5fe69e44ca7c331ac8161c9305da4f045b6c127b73fd07fbbb0411ea47c0c1"

      def install
        bin.install "yoetz"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.1.0/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0efa416ab284b2a33e7faaa3991ff96d0913845a61a07d7e9e2e270203aa6b93"

      def install
        bin.install "yoetz"
      end
    end
  end

  test do
    system "#{bin}/yoetz", "--version"
  end
end
