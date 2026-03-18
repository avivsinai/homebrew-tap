# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.17"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.17/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "b82b67dbcccace3432f63a8f1ed920e33c3fc3d0af1ab11fb45bbc2c2329b278"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.17/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "953efd0f21cffda25fc1e1fb0780714ae28b664d3f08c21c6c7ad214645170e3"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.17/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "88eaf3d4cae1a8b4eeef8ca4dd427e1e730f04b1263234f9b349c1258b5e2ce1"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.17/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8f392c68a16299da9e5c1176e0f6971ff258a8eedc2c54e6603dc43ca5321783"
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
