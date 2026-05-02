# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.58"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.58/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "dd73584417fcc5c33479e3b5837341ca80ec1fe3c6a81ab9015f895a989a2ae9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.58/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "1686978832cd08866131339e5ab31eec4d5d18d4754c0ccba07e5d4194733496"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.58/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "368a6f0925f130e84c5cb684ab0ec66d78f24b47e7a8c376327543055d4565a2"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.58/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "44f3905644c4fb23815b94857a72a3d176daea42663711ad44d99f4d314b2774"
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
