# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.16"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.16/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "63fa81c0fca8f71c8ce6b7453e8e34e26f16162c7525d6c1bc538cd68f9f8ed9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.16/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "e2a229d7e3816fb21a99c7d546b6b04054b225c88c9557e02a57f9a7b34b960b"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.16/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6d387539bf32eee43cc95e3f50ba7c467a1939ea9c8c7c3b46bc4d27e9f990ab"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.16/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "74908dd2c051a47ed6b39056ac6773c19a860825f8979ce10145de7c5b6121a1"
    end
  end

  def install
    bin.install "yoetz"
    (share/"yoetz").install "scripts", "recipes"
  end

  test do
    system "#{bin}/yoetz", "--version"
  end
end
