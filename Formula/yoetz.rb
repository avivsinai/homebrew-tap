# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.67"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.67/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "11305595810870fb4bbe1074854cc63e456993e997cacaa2a29ebb1f655f8870"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.67/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "f29a54ece769c416df30b6c0a4b37791f7d9c80b27f7d7a9bbf373d7a297a2ae"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.67/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b1526a1a01d8ad911edc0d484378815a04810bd8b06baeaefe79516226d3d51b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.67/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "401f3326dcf99cb983f5119cd636714d83ff4d74dad56d96b80448618b0cb593"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.67/yoetz-chatgpt-native-extension-0.5.67.zip"
    sha256 "b45208390babe82b5b5b4f605141c27be5c749eb61e9f129606f272e0f59556b"
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
