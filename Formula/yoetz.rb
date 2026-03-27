# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.33"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.33/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "49039255a5f851b2933c2c7cb7bc9457f82bf569c3d8368caa6c5857e76ef695"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.33/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "3e8cd37805553ed38a0b08dfa3dd5d4f84296129927a8517d9decb9a4e79131a"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.33/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6a3b4a70236a098a9df8c05a9093058cff028640d90bd98c8179a3c637d867d8"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.33/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d24e3a0b3f3b1b1afc154b521ba5758dc3a1688f4ec7f880dc827502c1f8bc56"
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
