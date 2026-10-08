# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.84"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.84/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "7bc0be72a5b4fac06cc8e7b4fe3fa47ecc7d8231150333c69e5fd8a851d43d88"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.84/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "5ba3fbcc18937829bb9a5c4fbcdb5a5980c9196665f234d4c4cca6d00790371d"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.84/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5c8310d00ef8c9c238b71be99621cedb689cd1ea56a4b4d6cffba8879323f4bb"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.84/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "552dfc225d8995484ab8d74e3c3eef8777b4601d83b1ce5fa1f335286ea22e8a"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.84/yoetz-chatgpt-native-extension-0.5.84.zip"
    sha256 "c8689170f3174bdc1a560864f328a9d5af036810eb4e40f972c9c210be745f25"
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
