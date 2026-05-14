# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.3"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.3/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "159a01ec46a5e0a0f032507f940edb5f576d97102a3f11e8b235841728afaf32"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.3/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "dc97dcfd9096a156a9b9442914728dc60cc2b2a198151e70c87ff1c28a84a1bd"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.3/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "deefc4eb26877747d333209f98edd4faf6e4353e3328d7f46b0414b4cd072d7e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.3/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7efdcb79b3df01c2478e8ed3aefe136958f2859f9177c7988b95cc3bf8ed03a2"
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
