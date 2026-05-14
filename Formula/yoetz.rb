# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.4"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.4/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "d711e3104db0a4edda4f62150cc6741975ccb41423376f045976aa0622b5331d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.4/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "b3f671673c05b2bbcfebef84333e8b2a3766108a5503ac759ee6fead72c665db"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.4/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a9ac425ac0553f6ab041b7d0b43d085e3bd7fd14336e56138e573555655d716c"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.4/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0d3f86211e3e291851c698afe9a7a618e6b42f755e80e3656bb885d44daf9a11"
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
