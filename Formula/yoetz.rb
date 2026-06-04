# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.24"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.24/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "3ac75458188c5a8fb56672201fb4ac400a42dd91f7735f25eb5624c4cfc5bfed"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.24/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "ecd5fcf624b295c0f2291d761b18ef2acb6aca0be88f5b05b9be4c5abe31969f"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.24/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e812dea6d462081df7f43e0d8abcfcf7a19f8dab2a44d956310f0578f62b7c93"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.24/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8a4f5424a9d071aeaf05861d0a0637600d4250c82be5ac4d1037ade3cd17c250"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.24/yoetz-chatgpt-native-extension-0.5.24.zip"
    sha256 "8f10ce2e277f20881f56c90832584aa5e7fdfacdffc2d3deffd988edc820ab2c"
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
