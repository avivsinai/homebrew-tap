# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.8/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "2a452ddc3cfca57cdd36732b24ae5315ef8578dd748fa02128188f8c485beead"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.8/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "94c70f17b8dd88c7a0d0d2ffc0e0fa90c40a284fb0498d373fab151ea3e37750"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.8/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b56bd15b15da59790767efa5a6fce9647e987e8ffef90e45174aa11d58e13514"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.8/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "21a2d518d5d9368287fc6e05d74f925ecd85d284d2abaaee3875ad956cfc5472"
    end
  end

  def install
    bin.install "yoetz"
    (share/"yoetz/scripts").install Dir["scripts/*"]
    (share/"yoetz/recipes").install Dir["recipes/*"]
  end

  test do
    system "#{bin}/yoetz", "--version"
  end
end
