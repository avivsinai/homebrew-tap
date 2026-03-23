# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.29"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.29/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "547197853b77918c81a7dfca79278bac5f3c6db085bddcf5c871f2428010167e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.29/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "5ce26bbaa9b88795424450d4126264713904915e1a77b65af8f10a7e8af94bbd"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.29/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f6eea5d934677c4353d9dcda3ab1f84881890b90400db3f1e02970657cb67b99"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.29/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "78bcf71ca0877941ad76bbf73e22a12ece8a85c99b3fea569b0851d645ed450e"
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
