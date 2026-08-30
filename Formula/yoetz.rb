# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.62"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.62/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "05c2dcdc4d6af5177b8ddf0d436b712b53714b6f2aaeed7cb84e556f8308ee01"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.62/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "c0b364f09363ae6f5a4923be1f9ded83fcf0a75f535cb0e0e4b0a509d5bb080f"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.62/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b3ccc1543201d31c0d015e944bea4059c62566977490d804f682dd18b4daded9"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.62/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "757fb19b743e6871b77ed4faf3e2ac3a891859cad93b371e21574fe9d911fce8"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.62/yoetz-chatgpt-native-extension-0.5.62.zip"
    sha256 "3376c0d8e953e69d453db7487630ede92735d3f661b1de3019f293aba788a6b2"
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
