# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.57"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.57/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "a67506430ed7aae0cc3ba9816d7362897846d8d2b1b547274e0edfff214d0198"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.57/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "b9974d5d46c569a4a1df67ffe03f9cabd5c3a0aac28db6a90df1541a39380cd2"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.57/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9122ebdd9f80beba81a9e8393c33025c377a7a9a00c17c52c3a1158e8b40407f"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.57/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f930406b2b660f984524f3383e92c2d8e7f2ea873419066458eb93ea91be5379"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.57/yoetz-chatgpt-native-extension-0.5.57.zip"
    sha256 "c53e2c1224891918fa2053748c71eed6e5df4d34a575fdf8d46bb142edec99ca"
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
