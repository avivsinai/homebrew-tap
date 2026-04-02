# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.44"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.44/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "b02939e7e836e329297c9e970edc2db1fb102ef3a45bc103515c5532a2bfdeac"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.44/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "8b00248aa7d053cd4d9cc4443afdb98b000a9b327443c218c14a058ef07276e3"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.44/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0e4260ec25cedf35efc7612cf8fc3ee4e7c17c7344927e932d2d6da868029aad"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.44/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "47523184f59c95a9b2ee5e544617040bfe09ccbccd8ecf3fde61f62fe789058f"
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
