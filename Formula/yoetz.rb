# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.38"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.38/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "789db33fbc8b150dc8011edec46347d1042faaf667015c096f20a8da55b11c0f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.38/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "6bd529ff2156ea655184022fd6e53986be1787e45133d7f2e3403eb357b8bd07"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.38/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0f41450fea24286286e7e2ba0fe78440e17a9b8a66771a5f60184b64367c6efa"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.38/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "67ecdb9055d37c77241465abbdea5ef4e3214ac49c123dc4ccaea2e9e2f605e0"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.38/yoetz-chatgpt-native-extension-0.5.38.zip"
    sha256 "9be43c9aef147028a34ccaba440a2d9f7849f53040352ed35f10c1a5978c71b0"
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
