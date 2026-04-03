# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.45"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.45/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "82479490a735f824c4cb359ff2f7db82f71730a388e7efc7dacc74076859d4bd"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.45/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "31ad74515a749bb8393852444605bb48967b918def162d368d6c9ed5f6a1a003"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.45/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3a0f3f0deef2ee74550adf867a8a253361d68dcacfed65a173adef084870586c"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.45/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f2f5ab88d168ae22c7a49682cfdd1393eca97c86fe656ae0be3879a85bcd02f0"
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
