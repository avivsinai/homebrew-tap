# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.21"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.21/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "1cedc40ad2139402ce789a24cf19e365af75dedce220e0bf965f92ea0999688b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.21/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "58c75bb0c73cad6afd7ebd198edd0ceb8328b98a2463f081916b31983c88e920"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.21/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c4984734393c736fcef100a89b5a135097765334cd491dae8352982ffadb1c20"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.21/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3372fa9d4f8e27453c9515e83beddaa8fbaf7bc2e559ce486ec50abe01bc23c7"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.21/yoetz-chatgpt-native-extension-0.5.21.zip"
    sha256 "7b78bf4afc5107289598f99a854400a5fd099d23071f23bd55dbe8432402e6c7"
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
