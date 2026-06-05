# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.25"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.25/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "b0cc1a47cd773d783ee9c593d15377f8a30d53dd0e084d32914fea7f814c8823"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.25/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "0688ab5fc801c472d88732456ccc0b96e748d303e40226a3c0d71fcb324e508e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.25/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cec0d49e5dc942eed68cba6fa9c522a4920889e9c2e1e3f382d721073a519d39"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.25/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "57810fbe3ab9056c2960247c110ed103dcf09f3183ab515ce8685dd8d2f0f25d"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.25/yoetz-chatgpt-native-extension-0.5.25.zip"
    sha256 "94cf176e084129c3baafcfbcd01145da2c9403c3424787fcba4a51581574e225"
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
