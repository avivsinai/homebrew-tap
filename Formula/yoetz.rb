# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.46"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.46/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "1f30df98570997fc292277faa0636043cfc1cf6db9668b7d139a79b0f51928cd"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.46/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "00cf0b3ff7c8b55b09cd59717e10ce8ffcb0e5bac0f6122b7e424478f847460b"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.46/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9805402796f4d7b58a791f6805e27980ad861f48690dddd5bd38b415a5c98856"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.46/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "29b3b244fb7b6e6777731bd17f6f24771c4a0e127c12fab33f4028ec36fe6c31"
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
