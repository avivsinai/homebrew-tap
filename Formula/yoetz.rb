# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.53"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.53/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "9105e9ff39c53725bc8f14fe02a6b7d84f859753c1d94713d28b6876f4f6b66a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.53/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "2bdbff593e965629387ceda6027206ffd5e8bd5b7aedfbc738c573c106611260"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.53/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6809db5ca561b70e7f61465453d9c937ad72dc30aeb6d1ab54c91fb2a4532268"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.53/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "12ffdea89d3e2108395a25a4a598c89312d2a740022a2f00e2038b0a9e6d814c"
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
