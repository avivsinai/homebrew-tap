# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.54"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.54/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "9a55c193dcdb98afbb04c92a344087b8948f5dfa5fc9fd7eb15321691b7dcee0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.54/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "d217352855f4fd0ee02500660be9960168aa576a2f0e9f045457555b3e7421f2"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.54/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8faf1fb00be1c0bad04b145d649a2ec24847d16bd842be0bb6aac487381b06e5"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.54/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5ee7d4d0863803f83e7192d36bf7b50db03bf83aac71d983ce4d52d15e8ab9c6"
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
