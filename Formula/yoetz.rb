# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.9/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "106b649ce2e482c245b13cffe53c81080a7b0d54fe24a20849c433843044d196"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.9/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "75274c364e0f16247b3fa8ab961314189e5e73863dc71d813f866b252d814694"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.9/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3a45b2551d21c9d86a5eade1a149feed6fcbe7595e21ae2d2d148894b6d83cc2"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.9/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "af40cb734da8cd1b392275a34b7ad6328b1d217e0147b5214f72dd62363cf884"
    end
  end

  def install
    bin.install "yoetz"
    (share/"yoetz/scripts").install Dir["scripts/*"]
    (share/"yoetz/recipes").install Dir["recipes/*"]
  end

  test do
    system "#{bin}/yoetz", "--version"
  end
end
