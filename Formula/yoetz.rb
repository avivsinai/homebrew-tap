# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.22"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.22/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "7d29c6a9241a822fbce5643304a09eb189b73c8242f96c05657875a2029c9021"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.22/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "9150e9bbfe0d10937b1626fe69da4357563c3bd364e3e68cb042b859fd4112e3"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.22/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "61844b58c9214e089097496f98952fa9b13681df564e0d4db27ef50115e3e2d0"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.22/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a31167a3807a160654e479137e525f0e351eb673402873ffb9f85671d9f3dd57"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.22/yoetz-chatgpt-native-extension-0.5.22.zip"
    sha256 "b403c08119703c92e7dfe54f513f2bc00acfb2bd7f743eafac257406ba308ee8"
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
