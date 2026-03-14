# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.10"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.10/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "4bfee5fa917d74c463943540ba00384b86d91091c15af71b98f66d622ddb8694"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.10/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "3337a240fcfc5b0674367824041351f225048e059706a91c6b9780da859f95f5"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.10/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a8a7ec37cf8ff35c72790e320ce024a3c55c635a5dbee42531ed75f28d9a4342"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.10/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "95dee284ea5137a6e65932be5c858e7c0b02b76934eaffdc79fca23725de5215"
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
