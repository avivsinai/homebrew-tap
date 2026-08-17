# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.55"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.55/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "9655733bee94366a35acc5a42cfbc0aea0cd9aab48fd6fbb68f14f7107ced42b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.55/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "ff73568baaf72a9e522add222186cbd4e70c8c65f22d85b61c3903f6fbe76648"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.55/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2fb4965eb1f1c0adaef30dc4b088847e7443c8c43e03f1149207efde68c5278b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.55/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a6ae795d4d4f5bd94c0a5586500390f8149f729d45461313afc0a3a8659f5545"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.55/yoetz-chatgpt-native-extension-0.5.55.zip"
    sha256 "24a5488e71c6861484dc5794cb85bf194a0a0714d2854399c7fa2c464bc940a4"
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
