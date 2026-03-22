# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.24"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.24/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "4c1ef83171505b8bac928025af142d80fbac102f81dbb9df0500804da7d1884d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.24/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "653bac82021cc30294062b09a1aff8dcd029b800af2165d24f18f9441a49d209"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.24/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "817aeda35bae721e9e526e5734a84ce5750d3ad75d853186416214821c8b4e80"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.24/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a465cfb4449b9f06cd149270c9fde156d30586588eb9dd132258e5688c3d030e"
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
