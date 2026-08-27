# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.59"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.59/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "24b67295742d331be375274547a1844e9e068c5142b166ad337d5ca2ad6d444a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.59/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "aecc78aec195296201e969a0735b7937539d76936f39dc5961cc55fd06eced5f"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.59/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "937e9cf397c04fb913c4553c5ea4803a48420df4308467e43d43616373a48e91"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.59/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6b40e3a9e9b0fb35071c0bb111fefb17ae02446818d3abafc244c6c9f85f2263"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.59/yoetz-chatgpt-native-extension-0.5.59.zip"
    sha256 "6178fb8460bfaf2c9aecff56e90c025fa269e52474a7c068d280a8404375c76f"
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
