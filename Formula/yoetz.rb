# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.78"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.78/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "686ddf9ca509377191a2ca2a356f6eb3cf8abc6c352470597a9e86d37161f000"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.78/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "6ddc9bbb31d0c3560bbb5134a5ec0a2ff98221fdc9b0fc9d9e3fbf3b978c6a7b"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.78/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a95c8df7e3f056b2bafd35705bf0160587bcee1f375371fe5cabbf9438610752"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.78/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8a0ab5d73f62ec1f49d751399dbc0381379d68e74a5cd63d74d96f17363dc8f9"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.78/yoetz-chatgpt-native-extension-0.5.78.zip"
    sha256 "fba8b64c4c58f08c9593158ef360333f443da1905543a590ae83351837c9d8c7"
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
