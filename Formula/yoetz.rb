# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.93"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.93/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "62e0f47a5493d6e0e70ba8a8c8b267b83f29501fb7e39de014cc8b80271da282"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.93/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "ef88421be2fafa0ba931a7371353f35740a40cc2fd982c3ac1db4603c18508ac"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.93/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f3ec260f3d854f171ac2e01e36c321401fb463a8e2c82e781597ee33a53ad7e7"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.93/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3bd355e9e9da88d4cf0479590fdfb13135511e938172fab7b595f383065d765b"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.93/yoetz-chatgpt-native-extension-0.5.93.zip"
    sha256 "d9c1e26b0e9dbb65ff6a986b983a865c611a76e9ef2650fd3e40313f8a9f992d"
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
