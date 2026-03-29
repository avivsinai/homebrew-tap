# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.36"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.36/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "c4664238baf57ed55c0c736906ba37c2bd60e826238820d7f999954ab7cbe61b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.36/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "65a1aa29422a1cc8a546f5e87177b1ebbcb550ae4f1d9149f779c66f2acb6f5e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.36/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4da0bdb4a5e966666d998df73b72af39b137c2bdcdb38fddb38449d6eba52ae0"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.36/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cd5db4b26a4dd77692a150746846b700b3cb8e402a8912804280dac560e0a851"
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
