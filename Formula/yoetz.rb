# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.95"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.95/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "c56f025cfedc2d6fb608bf0f0353d1ff9913918d3ddf1592eac61a6f5c60fff2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.95/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "bdbe04305ea4a7328685ebca65a22847379c0d401df3b6eb5bcb17572ea5f4c9"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.95/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9c28eb7fb0cd8714a1abc0118f1809bc8b58701366e79f307d6cea0e5b197ded"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.95/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "37bb520925f1f67ec23ecba8be3e75ba37da8df7038741912d815abaac1f163e"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.95/yoetz-chatgpt-native-extension-0.5.95.zip"
    sha256 "f618ee717ddc0cfbce5696f1c0cdf618b213b904346478ccfc18b4acd983cc5f"
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
