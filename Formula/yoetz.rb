# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.12"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.12/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "2c2233442b56017d2dd20d46d9ecd23e3b751682426695decb20a4db33f16c4b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.12/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "176111a6b6985d87085c751ee06ef8d3809e1d3623bfde9493c756a575310866"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.12/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "905d417cfdc394328757b27a7db363f20853c3a5181114b592d19ba577a7df11"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.12/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d2a38a0e7864779456f6ed51adf59aee31fab7249a3012b84e1607d6fab6800e"
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
