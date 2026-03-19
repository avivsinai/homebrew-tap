# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.19"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.19/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "6f9bbd1f1e792920f6899cf04bb47ada0bb5ffe056c5adba4255329e85353fb9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.19/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "61739fadecb1e7fc01eaebff7abc9a6fc90b0adf708b298761a87d345477307e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.19/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "67feace187cbea51eb9dec37367bd75d0825904637704e25b4c188c6fbbc0389"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.19/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "37a2f26ba7f7fbaea60c9c67337510245095b30af0d9619bf360f6f669f70b3b"
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
