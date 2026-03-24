# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.30"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.30/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "cda23492f8d2119c4fe4585c3665fd0192ff9e1ebc3c0484aecb81403f777602"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.30/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "87fea5d507aad68559348a6053ddd1513f20d4320e030c7522eda536bb3532df"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.30/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d90508db1b2f19c76948ff8ec9462f690525f9aea56a479f7af5ed1dedfa06d2"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.30/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4adfcb213d0086f915f46325df476c9a16f2885e802c42a066d23ba97fb2cc81"
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
