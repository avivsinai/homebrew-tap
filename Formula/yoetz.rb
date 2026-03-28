# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.35"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.35/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "8aa55d05d08a2d8db61297720e8d3037cf3a25c9fd3d71b628a18befc4a04561"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.35/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "9db15e8240bc0a6cc6d5a342996bc0dab3e81fdd27b3b8c1eacf1a9bd6f7806c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.35/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b80120f1e252e324b97d621d7bba562baf3984ab4dd7e90ad45a2123d3f8ff83"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.35/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "db69a7d01ae7c983fe4ce91b58d160e2b28de620ed136bb4913efbb9d465bc5c"
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
