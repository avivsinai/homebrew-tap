# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.12"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.12/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "476b266988b10d5473caa000a8e0f48e911c7f15353429e0d2143d2835e6a1b4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.12/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "a258feefa2c3c3ee3f5d407133e2011d4441229acb3ea4ffc9ab4a6848cd9821"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.12/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d0e605ef2fd6405873e32de3411d46be13025ed8a95217a495cd987cd550a691"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.12/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "79b16c05af302f9fac71c034c7460297f3b228a38659ad677e2adb46ddd17463"
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
