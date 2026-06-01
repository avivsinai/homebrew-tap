# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.20"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.20/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "970356b4437cf18e86c01a59f7f4661b7e973e206c4560b1d93c271052772b77"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.20/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "79365451549aa96324b1bb2e3cbb47316d35abdca816e186ee16da9ca51af819"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.20/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2e1db32fa4c72b69d0ac9b2f18ba0a81e6bbdc77f16a365e46c40f716efaa138"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.20/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3a0e0ec4c055e69ceb9bfbb94979544111caac8d3e0f08c8dbd4b5f66327a82e"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.20/yoetz-chatgpt-native-extension-0.5.20.zip"
    sha256 "3f2705ca2dd6959429fa1697c04a6d924910bc54932ebb3ed4e180fe6e9e220d"
  end

  def install
    bin.install "yoetz"
    (share/"yoetz").install "scripts", "recipes"
    resource("chatgpt_native_extension").stage do
      (share/"yoetz/extensions/chatgpt-native").install Dir["*"]
    end
  end

  test do
    system "#{bin}/yoetz", "--version"
  end
end
