# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.70"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.70/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "c57df888c139a3379a21b51b05efc5b4f791e47174d4e6e4c3209bcb353b47ac"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.70/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "81cdc21325e120db105570b5085cd78b1b9f0562762012ca970b9a8fc6738ac2"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.70/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3e97721c37308f2ffff21a6b080eb8748b849ebf39aa6dfa4d4d167cba2cfc97"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.70/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a6ba81cd1845843d746f87380f1f04f9d504d2b601436e5c8760a6fa92012abd"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.70/yoetz-chatgpt-native-extension-0.5.70.zip"
    sha256 "607c1e9c96776308ff0f134d27ea106296614d0ea100a8a28e8c2b3e607a7e84"
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
