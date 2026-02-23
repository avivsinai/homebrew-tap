# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.6/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "30e578b2fd9eec0dd17147b6ff1cdde73852d65f5addfb3e569212a9d5cbb593"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.6/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "54e9529b37a245013c6a3bfe57c4b7a02f1dacbd7c8054c728e7a8e22c076192"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.6/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4976ffede60854c4dfacaee8eeaa22189863819f58eda1f445f1fa31dcf7c917"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.6/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "733cfb37a8d5704c630f58c4058a5abd172b96673f7c8b19553f29df7756b7bd"
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
