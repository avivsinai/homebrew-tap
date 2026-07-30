# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.48"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.48/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "978ebec09e9f8cdb06c5d0992d0b431f2fe8265004e92dc8d9902b714eafe0b4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.48/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "711d66b7783a1967ab9f760ec4adec77ff3c35c19d1a336d6813782bf96606c3"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.48/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "51819064c68733b88188ebb79b11d3bfa1446a845b83701c843f3661e27eb4ae"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.48/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d42f029001bfbeaf602493df667d6fff7698dc5529a29aa03838c00941532fe6"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.48/yoetz-chatgpt-native-extension-0.5.48.zip"
    sha256 "e8ca5e73df10946595488aacecc2ab231029520284990ab9ae33681e93ad741d"
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
