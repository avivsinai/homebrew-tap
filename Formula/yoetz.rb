# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.27"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.27/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "7411d4d3235105b25953be5653b8315dba6c350449fc1ea26c5ad52fdd9b2756"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.27/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "99233c4e6e63b16455a576b4a73e084d14f260b25a7e4a401d186fdc0779f39d"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.27/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "90aeb60c56c36367d4320109eff7d28b1639c782d82a762f29524f7909bd4507"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.27/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fabb5c4a899f67023f0a0b8384c0934bba76cd3e99c16710cc86be3939d6c3b5"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.27/yoetz-chatgpt-native-extension-0.5.27.zip"
    sha256 "1769a595651143a763c60e595f4d028b090a1ff07d95134f88645243676269e9"
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
