# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.18"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.18/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "584404b9506b99d66a1825596d344bb9d86645ab09540a43e9c47e7a8d527707"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.18/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "be8647bbfe93d2722bc6023cb405cc84db56f3cfe2269eb8af43f31a123e4645"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.18/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "056043eeb80c4d0765dcd79ed51c77e1b5e7d60d3594d9344d9514bad7b064c9"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.18/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a20922a25cb1d06071db0d443ef3b2517e1bdf5ff962c7925df045f756c53e4f"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.18/yoetz-chatgpt-native-extension-0.5.18.zip"
    sha256 "d23ff88368b10383c742109d89737bcb1c50bc623088ac22d6f1a5a961b48a34"
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
