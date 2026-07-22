# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.42"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.42/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "fcb6a9819b453dd5df2e40c741951095dc0f5d399bd73dfdc222d60a11bef90a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.42/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "4bd88737bec36218805e8b40e7defe3cf16357e6177f87f9f2e7e53ddce990ef"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.42/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c07a5af744e0dc6d37ffa22caa63da1f77c77dbfb64732aa362293f63f44a028"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.42/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9b1e1b50be69ea915eda273cb63b426f5bc15e200ad2dbe4b0a2e09c2a0dace7"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.42/yoetz-chatgpt-native-extension-0.5.42.zip"
    sha256 "4f9d7675dbeac284557c59e04ac80c91a48f5b59004d71eaf3d7c25d191b52b1"
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
