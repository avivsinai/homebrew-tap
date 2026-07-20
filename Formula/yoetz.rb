# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.37"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.37/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "8cb04f01ad60aa6a59a46bc0a454ec8f37203fbbd9058ef87cf47eb98ae22fba"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.37/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "ad0b967fd12287b841f1d6d427b4d4a189b3fe025d2dbe0cd019efc8a657d168"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.37/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "16aff46e778b94caa235b93fe5fb4dc63ccbddd9a63ae12a9ab2d945fcac89e1"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.37/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f376543d186c29ada1975ab92ccc1db39be21e41d049c96eb5c03b48d8337c64"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.37/yoetz-chatgpt-native-extension-0.5.37.zip"
    sha256 "ca761a0dcc399980103682501fb0fdcf1634b00b30f1abce2d3af62beef9be18"
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
