# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.27"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.27/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "2c0f96ad211f961bf1e66d9c8e24919abbaf81894258e6f5dc6f5d14e17d2078"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.27/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "ac9a42acec5790e34563792d8efce9e570600b7808a871b6ede8569c21e11598"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.27/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5b738a100e1f303f0e3928b1d7555e510cc6a1a5c4eedd8cffb262badede31b8"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.27/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6380394a2c4039f523998a514a7b5a5f2fda7e33add9585090f3e43e6e37e8ca"
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
