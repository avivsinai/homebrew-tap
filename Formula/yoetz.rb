# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.89"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.89/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "99a585c514f745cce2ce272f1ad03ab357b978864c12d2ef89ebec72ce9029e3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.89/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "349e3f242b4bdd9196fc36f62dd9f58d5fd6aa26d91f77104c3115824dd9ef25"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.89/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fe7708c8355f6691852d44448517c865a261175781b8f72266bd55e8485e905d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.89/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2db1799c709de7cdca0a2e29673541070fafd406bbe4c8df56b1a9eeda2656fa"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.89/yoetz-chatgpt-native-extension-0.5.89.zip"
    sha256 "001190241cf24728e9e5ecf9e91998818116f7619e22cadb2586da952dd8acc2"
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
