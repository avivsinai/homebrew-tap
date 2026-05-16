# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.11"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.11/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "d41aae66db1aae0b586a1a460e5f81afb9d710f1461ed4660310113486845384"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.11/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "f196efe32835abdc6df986f0bc5610ce102f3cd5ed04b709cdbd29fc5cfbbea9"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.11/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b15ea8b51a48d4065396d7a3fa9d475754c985007919f7af3f130beb6e0fcfda"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.11/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bf393c4d0bb1234462530e643a308da9c12ed0239ead98c8139c165864f0ff8c"
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
