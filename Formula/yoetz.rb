# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.63"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.63/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "754dc46b395ca13a2e07f45b3ee9eefa0017c8ea7911f3e7683e1a457403adde"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.63/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "fed77b634084713989cdafd2594b483bff204f563dadc8213b4c69fca9513f25"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.63/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dd256638b560afa67f857808a3da797a48928fd4906ccf574a03b28e7ffc313e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.63/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e81167a4c2686b68d9a9241235118fd3bb1de824f3a30f76f46b45b8eb7695ba"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.63/yoetz-chatgpt-native-extension-0.5.63.zip"
    sha256 "61aa597fd2dd04a57dc4cbc04cfb9f3eff74a10ef087a527340c8eb43d20e05c"
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
