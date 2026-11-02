# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.94"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.94/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "22cb98d918c796c8e1cdcd767a5924c87c9ecfcf7fee74ebf3f2fa37a4d01a2b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.94/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "eff1ae9028d71550caefe56110b84ff87a6820ab08bbe21437d315e75b4b1dd3"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.94/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "31d1c98a04129f6b18609c2cdc0f31f15c8ddffcaf31c92c393c9c93289d3d64"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.94/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c8345da562754b56949aaa7a5e56ea0329a1aa2853c28a9ca461a86ba749b854"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.94/yoetz-chatgpt-native-extension-0.5.94.zip"
    sha256 "bbcfceb5c3031de772d795a1575c51386db14e3ce53f07e25cd24ef5833b572d"
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
