# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.53"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.53/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "fdde80e79ad5b3608082e7734aa13198fb57ed3d4ae645d862b12a9baf1e18cf"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.53/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "f2deb84c95318a76e0f1243b5296563f9813994bff22979296bb917023b3b35b"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.53/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3a2cbfbdfbd1fca671dd7fddc8bbff50fd7d6ef615b7072a57a16fa61e0e313e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.53/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3cb9b398342cfaa7f647e44246c93b3b8622c0e8c1715a96f7ba3a572b08e8b2"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.53/yoetz-chatgpt-native-extension-0.5.53.zip"
    sha256 "dbf1cd3a57b32d379e13218b6dc0b4c6c0a41f08a52b3f24f5da15a72cd43b42"
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
