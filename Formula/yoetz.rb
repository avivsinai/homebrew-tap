# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.7"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.7/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "5500d618cd066b74d1a37335673e782a1316dfe936b2bd59fd042c13e305b24f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.7/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "3b6fe0067579bcd6964e98d5c424251d84eb52ea7c53d6c5acbeecec7dcf1db4"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.7/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eab4e480c372683c6eeea31efe9f4d70d814bdc113f938338839eef997a5d65d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.7/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "62d36ed1efcbfbd7017d860f5e7beb40078d019d7d84de7b1ff1847a3f64ae43"
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
