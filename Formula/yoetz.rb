# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.29"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.29/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "6d36b61b60f12cb4f93eb72a300fa0f8090e3072b724ff4a39721d49a80c7b22"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.29/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "f67d288c0e4d7171ad6cf49196389e79e8962e6b56947f8256495206a804ec87"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.29/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5b419c5479c1a170358a41bc74cb60ecd93902ec4e20a781b9430e48e6379141"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.29/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "185d77446d559b8d6f6a9d2d259a28fc83af050573d5e0a7d049be4690319a71"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.29/yoetz-chatgpt-native-extension-0.5.29.zip"
    sha256 "d1b4858d74ef0c625e643c581b3203310dccd25f429b4b974b9534ac4dac7f5f"
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
