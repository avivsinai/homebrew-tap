# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.88"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.88/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "6760bf278081612ed6d2caba9edf4eb90ac7dd759ba0acda87c8524cd149a263"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.88/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "63cad0f8dbf62af6a42dc8c8ccf8db17141c4e552823ba00efecd1ad61e07af0"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.88/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9e289935af9590a7335cbaec0d50e616319a5eaec9532fed7d1d73463ef9f6fa"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.88/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a98173b58ef2f6cd067eb6140a15628e09981b88b72a5c6ea4f4f341dd448396"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.88/yoetz-chatgpt-native-extension-0.5.88.zip"
    sha256 "80b0539336a47644d81c1b56ba7cd2581acdae1e77696ffcd6a818b3adcc6df8"
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
