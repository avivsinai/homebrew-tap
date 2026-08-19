# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.56"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.56/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "060b95ea435f36bff9148b6c97480f187939aaf8fda7c12aaddb04371fcb2734"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.56/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "2d8b0d2e3cc6509ba75da605b29e095fb16ec1e570671e5588dc3f2f8e7c3e75"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.56/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9440c6214af227ad0778afaa4e7f36f9526091dc4a043846e3c36fe5314c14cf"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.56/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5a8799af7739b339ba1c789cebac85cd4e63df6dfba09f33322bb3e1d25bbbeb"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.56/yoetz-chatgpt-native-extension-0.5.56.zip"
    sha256 "858af0f08585ffeb5edfa4035c0a7e4fac733047e8afd019731eeea666fb0443"
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
