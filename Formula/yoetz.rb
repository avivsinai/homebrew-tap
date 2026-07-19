# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.36"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.36/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "25e3ab1aac19598916e4c2eca965494c9732f30f8c1c1f0fbad109120b70926c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.36/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "f1c3920189ebb5d7a0112c04a7b556a16dfae672e9809514723f4b701b54b938"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.36/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "76c672038c0f61ff93ee46534410fb67c7753c0fadc871e6714f315c1298de6d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.36/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ea8110fa87d864b2ea910cc1696c090a85bc6737912efcfae8a888f6411e6cb2"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.36/yoetz-chatgpt-native-extension-0.5.36.zip"
    sha256 "2a8c683836c295df0a110fabe7cdbad2d1c84a4d93c009f7f4657f272b83a859"
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
