# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.99"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.99/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "d78227466ceecee29a6d32c026c29f2259ab72eabd530a1170b10bd002a17982"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.99/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "c9fb39e7c0fb3180640a9517959ad77830c226eef78fbec12f8df6448fe86e2a"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.99/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1c6f366c88a637a7494ea28f71e2f745609e131191365c241017b96bb4882317"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.99/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "617ee00111213d40f33c1dc58293acb1ee1f3dfdbb61a8d3e02995cc78d7fb5c"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.99/yoetz-chatgpt-native-extension-0.5.99.zip"
    sha256 "83e61638ccfc9f23d1fa7ae195e06a0c4becaf71b8411d67451618bd4f584c68"
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
