# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.83"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.83/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "a999ebd9837c820ab8d14d9e26b6bb213f7d05f7f7e2ef5391a5424dca21ebc9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.83/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "cfce19d865f4a1d469605a3ec142df6cc44416f4ffce70958823af23de98c9f0"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.83/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ebcf53a67a3e8831c638891b8295e1e1c0ba55a6a77be3e031cb46853cbea3ca"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.83/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f9cfff291a707d3266722e3795c4592be99e405fc1ebe1e9d99fd300d0fccefd"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.83/yoetz-chatgpt-native-extension-0.5.83.zip"
    sha256 "d8ffaa4dd3a448bae43166ad3200b677c571f3b8b7a2c94d7067e5136b9f7c32"
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
