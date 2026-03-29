# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.37"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.37/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "3d233ba0b4595e0cd8f5693dbdc8426f4dca00bfce4f59441baa065aa264d0eb"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.37/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "1c821257fb419ba093d56ae5ec0c6dd0bcf920e50edf104991d0095fb1a348e9"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.37/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d0eaf1257db1cbdc998ff3e7ca6387f6fea03221160c3d6df7001c5a6e6d9f5a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.37/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "884d5d8d6be804e1b0ff159f89cef6e1d4ce1c85cf827899dc5aa88352199815"
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
