# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.23"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.23/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "0ba8113b297f66547e5e6d7c48d9c3596b9956ddef5e36095244c7cead314383"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.23/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "0dc79fc02f9a095514471d937e095a821afe79ffa53ac46c633bddc27bdd4988"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.23/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4154ccb50914f6c8dfb507e7a8978df25777cce41b1ca16e0c4d66a62402899e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.23/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c85cd40e1bf490aacdf290dc3e2b7038bf2c8c3cf487290d5aaca3d05a4385ce"
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
