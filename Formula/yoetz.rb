# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.15"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.15/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "08ac16e9a591589edb75b09e45b144b4fdb7e66ae2ffeef2e95a0f5a847ba36e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.15/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "0bcb146243b3203642c8217d331ffc08d80757a95fd30923178cecf1cd2af15c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.15/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5afcdbca36e7de0067674fd4b76a4acf300a7f534c0ad89136bfa6e3f870a447"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.15/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "57ade3cf12882e3813979d40a5c6d51b5dec3dbb81c2d57ad43a048f4fc1e71e"
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
