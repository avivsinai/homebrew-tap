# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.71"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.71/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "728b67b93be38769460395a95daf44283eec5347097ff6cb49b633808d590c1f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.71/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "3219ef7e9b8c97ae26b3025cbf9c542e0cbafc1152ab731ec3be1e0951c8bb57"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.71/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ede2e4d8bc34b07fc9a527848371be2d47e54d17aba03abf2c751a4e20e1cfdf"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.71/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f5ce4065a7b404cc2892962e7099b925ae3118d5164a0db8ec39009cc063be40"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.71/yoetz-chatgpt-native-extension-0.5.71.zip"
    sha256 "7d75d5295387d1a04b2fbd7e971208904a4456d5f2d30db5415b9aa5ee137981"
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
