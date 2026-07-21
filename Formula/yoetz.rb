# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.40"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.40/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "68857ffa5e1452d989d810127e1a4cea6b26dfe8b3ef7c000cd4315c39014525"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.40/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "68e2c2d676c658bd0d59d5e6b5aa5cf1e6bc4ef3a8dce4bd2a44025e238fd865"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.40/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "034179adac741f8c4d8983efc1779a313d46155c4abf3952b8dafa56b4bcb27f"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.40/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "831c80ab273bc915a348e1309f76c10c7ccabecd8096dd2ee1529b19d25e8303"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.40/yoetz-chatgpt-native-extension-0.5.40.zip"
    sha256 "d8aa58fe49c92c00b2e2e6349731dc4665c67a9d7df7ae1e93fd9e1ebc1e9270"
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
