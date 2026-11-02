# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.96"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.96/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "7f2d076e45032081d41ca9ceba534e1cb2a87c476469e22378b78e12179e3e0d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.96/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "7a88f72339171f9753528bf8da8c21b905be6fd2d90cfdf59b3b3b80078dd6a0"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.96/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "79c9aa7735305439ddb72eaad328d19611ef7469745eb89128bd2b2fa7bd130d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.96/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a56a822d4123d8ea1b06a0b31190a3079276c4cee2f15562ec2e3b41f459dbc6"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.96/yoetz-chatgpt-native-extension-0.5.96.zip"
    sha256 "3e4c235894d1bce1c278e68848489151d06f98eee2c8604ce2d771c7eba28c7a"
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
