# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.47"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.47/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "9cc64d7881e8baad29297dbe7ec63cd3fd99961f51b8bc2aab81b0061f2c5221"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.47/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "f7e0ed9f7f2e6aa71df36f52f74c21675e11fc9c2482c18597a24159f4a3f40d"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.47/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d79349a238f42da590772b5d403dd3d10759e1715b1f855b6d414d42b2f8157c"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.47/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eef86ee52e10cbd16ef7eb93cf899af52fa92291f720b11dd462b5ecfe0c1c8d"
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
