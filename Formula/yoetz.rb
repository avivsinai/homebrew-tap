# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.44"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.44/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "63b19c06e59293691f47061ae7aa9ad1d2fc8dff0e57013c7a32768b0c57cb68"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.44/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "88635052b8d58119462551fafeecb4084799473421cf4b4ee9dfef602ca253ff"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.44/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cbd6947ab8279dbda72d2a62a641628f37c5a338d3f66989be4d66423ac0ecec"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.44/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1482e82d91c66c933a692df5538e0cb4b588603752fc126e4cabef55f21d6c51"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.44/yoetz-chatgpt-native-extension-0.5.44.zip"
    sha256 "98c00c660e8f64a62e3c0881e31e8bc6cc8010aced7a328cf0e4802b5335b6db"
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
