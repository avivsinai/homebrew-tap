# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.46"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.46/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "744d73f0c0f8e832db218aa96d6c9831ffc91c82c8c401913c22a95d582a9e9f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.46/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "1a72dfea3301b024170227995ff18f20cd045a73c74877f680fd43d018db3f37"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.46/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fcbc4ddfaaf267228f86533f64d79f382cc2b32b923429b73af2bbc057f4f1a1"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.46/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8b1a1533a92b6d1e5df6611d65faeebccb5bb7578a31c3959a3cc19c2d68dc82"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.46/yoetz-chatgpt-native-extension-0.5.46.zip"
    sha256 "2dc77e9e4922596bfb107381c8a4b928649bbcd0a419e5437305830f4a96401c"
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
