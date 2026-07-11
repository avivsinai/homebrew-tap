# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.32"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.32/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "a08d22ad8adadaa07401d00299d0bef82480bac65f1417259737d713c51be537"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.32/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "e3263a4795fbdc76f647fe32b80363d36aa29237263857883af2b03ff571fc82"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.32/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c3e32bc0c87c6b4fc994bb430cde82f9a0c4f3f87f93e3ce8091271be186aaeb"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.32/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2fc8cbaf9021e167fe2a0f0628bed76406ee495a6fa4721eac91d6f254b7eca3"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.32/yoetz-chatgpt-native-extension-0.5.32.zip"
    sha256 "c4c61c02361066e88835755a0343ac8232f53c23abce8ae45d753bbd2545c106"
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
