# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.40"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.40/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "544214cc5417342ad92026f193af0941708980e1934cdd4068bfe4b13093ec42"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.40/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "79b40ec08ee45106d02bbb5ea1371fe2895d5392b945d1619295f7b61a5cd20a"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.40/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3d135137e57a876479562b8f62f79306ef075c52ca18bb946fdbb16626ff5324"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.40/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b9fcc951c64f3a42bf670c9123d264fc525db209ee0bd8f5b748c6b098d65f55"
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
