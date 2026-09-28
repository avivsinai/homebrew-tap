# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.79"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.79/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "280a7daddc7909c735c586dfed7e0b5c47048f8268834ca315c7ca0062ef0205"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.79/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "7ce2726a19a6c7df04dc899054731c03262b75aa516af47130c1b73588a64b3e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.79/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4563039571fcfc629123eb4f915d972858059ccb18f9cdb9c36f37d2caef4219"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.79/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fdf003d406555a6385f1080b87523280baf7a2f0a76561149c1305babd29d1ca"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.79/yoetz-chatgpt-native-extension-0.5.79.zip"
    sha256 "3a038a01639769e40403178479eef2180f6248ca53894ceca5045ef252d90289"
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
