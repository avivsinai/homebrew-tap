# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.59"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.59/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "cbc5e7dbdaa5e0e5e058915c7f723310aca10c2b33cac6531c7dc9c713193870"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.59/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "b5106b39e927519b6068f6ecd0bf3dc79c97c44b27ae1d459148489fad0de3cc"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.59/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "93ad4775c70beb79fb6c02a3247c102f116a4cb3d288d679cff1875501066b9e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.59/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "489d9710910f5bf666ac27504ac8d5581a70fd0605057c4db54911fd7970dfc6"
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
