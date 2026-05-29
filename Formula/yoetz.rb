# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.16"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.16/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "02b1dc0662a51eb18fa27f8418ecfb43701a37b43c788ba8cfbcf640180c0c47"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.16/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "739501913f66b0310d6a1d7d5a28c50e651b941a16e467f22150f578c647ea10"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.16/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f8bb4a00fbc3cc5911f0797acb9477f4f8a64a8630800241413ec4fc51ce713e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.16/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9bd8eb07777e943de0bdb6376c217593033e2168a6463e9085c48519db013fad"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.16/yoetz-chatgpt-native-extension-0.5.16.zip"
    sha256 "d413f716dbe47c51f74a6aac366c4a7e86965fcbc467c05d5b5d92831fa0b999"
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
