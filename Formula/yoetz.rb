# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.92"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.92/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "10c6686e0644e9c8924770b95e31be74726ac46770b9b93c07169fc09daa49d3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.92/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "c174fd43fd604a4210ca910e6113e98aa25e27aa39503b2fcf6d04e1a248519a"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.92/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8e4f12033221c66e2f9589994a9f2567d366180fea773e52d5216555c5"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.92/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4939e2bca7db067be445f4ef75b63777c1a00fe09d3f6dfdce8f96cc986da167"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.92/yoetz-chatgpt-native-extension-0.5.92.zip"
    sha256 "feab2802fe88c94c5fd55cfdfc51a0c0f777d029c179d4e0ef78d9152d490a36"
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
