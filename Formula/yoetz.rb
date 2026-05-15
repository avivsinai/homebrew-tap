# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.5"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.5/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "eecb192238c60fbd9bf4b06ebe065e787ce3e746653c4ae2c7a48a6fd3f77598"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.5/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "b72997481de16211cf10bd0327942149e1481dce15cf9e923b28f76d1c4af124"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.5/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2d0043c3944b76771d5db19b0655e92646226f6069ba37d0351479f8c7780efa"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.5/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d3e3710e0003d2c6ac41e02715687ba49c639813b6a89f2268b4dc6d36e54eee"
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
