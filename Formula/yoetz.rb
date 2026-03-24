# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.31"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.31/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "17138c0d135f047e63dbc8f649c7e192f4fef135e5652bc4741130cdd08b306d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.31/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "9153a4104d3cbd7f445d148c0b913b5da60e68703b1a9a55fa71893e838de592"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.31/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d62bd94ccdcb5600b77eecbe41a78b03590fd563a4e0bb20215f58002fa0f6b9"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.31/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d4a0190ade6a3907079ed5af8615691700f315f1599ee58de2f6ea61e7feabc3"
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
