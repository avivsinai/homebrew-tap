# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.15"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.15/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "9d975c09d29018ad004c038ff68db32bc0292c5cbe85a6b7096425e869b76500"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.15/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "e3b7e379a4f81fa6583085ef2c04e83c96527fee6e852e996f88a687ccdc2025"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.15/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ebd7783897f257e92fd92ca530a076be8874ecc53fa482b695868a161c0f138d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.15/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "11ffeea3844fc9fc23b7a5a90817927259a03fd43160666ad927da5aad28e460"
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
