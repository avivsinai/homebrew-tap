# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.58"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.58/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "412d0e448bc5c8bab107219a3e887ddb9a2ffe6b64495834f4910dd16dfdd9ab"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.58/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "2065684f508adcb06986fb4955f741ae987a95618869b2fc405f8f2e7739b9bd"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.58/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "552842a47e6df84e1b553f345cd00bdd0b232640af56b86b2b8a3973870eec51"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.58/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fd773f250b609f04df1361c223866c2cf5ead49d33387750d85cd1fab3252b18"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.58/yoetz-chatgpt-native-extension-0.5.58.zip"
    sha256 "b9ed2d478ace9d6e987c2d63fcf9c10d0d0c1765ef64f353875311151be79486"
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
