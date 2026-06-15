# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.28"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.28/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "175448a81a92b4635fd423cd3ce6e409887e1e94d52f8a67c3c8348b5ffc766e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.28/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "beabaef504230047a089f21f9a018fab02b461153364996e684f32e381fe78fd"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.28/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6f24945dd99f3b8fb042556a504d83407eb299ddb35a2bf00f178a49c65a6ced"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.28/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7b628b7324ec62cd6bfe37415bd921a37b98440c4d2572ed04b71a9a0a268916"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.28/yoetz-chatgpt-native-extension-0.5.28.zip"
    sha256 "9dc3428811bdbf3e1cd57c57a5344631f6a9807c641c78027d9b90e74f1dc96c"
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
