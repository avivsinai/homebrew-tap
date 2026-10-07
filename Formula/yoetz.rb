# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.81"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.81/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "2a27d3b8abb8f5f09e1c7bdbbe8de58479ecdc18e376c241d56421642c0c1840"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.81/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "49d167a02464dedb8319287b37515ad40b4a27f5ef21a6d7b0e199b58a3c62f7"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.81/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "066653ee3a5e5be9f8131c85e4e29c2b602916d47c860c771e1a8780ac21bf05"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.81/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "01f17637cfc7e8f7ad39a0b5185507dd0bcf051edc1f9a6e1c44c6e949a368cf"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.81/yoetz-chatgpt-native-extension-0.5.81.zip"
    sha256 "c162aa24e72d5504aa0b74fc237a88884b3cdd1a997fe97b9ccd4e8645fa94bc"
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
