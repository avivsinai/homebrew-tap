# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.10"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.10/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "c6322d4d37207a3843e9301a8940bab839aba816733b686a34029416bc5d09e2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.10/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "3c900d2cc8b9a58208e730bd8861b28007f78318e3af2bf722208182f89cc862"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.10/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6379367a30316f8ef3a6fb378ac155535840870267202b0525a2b71096212147"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.10/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4ada8102d562491bad5d719eb0f18d15201c84845392eb8328c4f3a64fdbca06"
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
