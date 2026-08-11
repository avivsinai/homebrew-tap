# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.50"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.50/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "896726532bf53a83a71a26434c19795517d554724fa4b69355b4a8e93673053d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.50/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "fbcc56089be46c4ef33e9210d8013d09788ddc391a1a2b91f8215bdf95e90017"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.50/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2d66c174b3e5fc6690eca1ca97d9e365c822db060de475e22a3551383ed14d32"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.50/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "17ddcd230d5e69d393f0b9c031e065633359ef95b3e55c25459e50dcd36737f7"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.50/yoetz-chatgpt-native-extension-0.5.50.zip"
    sha256 "4a441b019f6801047ab5e2fae1b6461419f1a97473ee899b214211b4b2d6841a"
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
