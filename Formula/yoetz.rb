# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.56"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.56/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "9f2da9d1b37cf85e555023946c39a7031e77236a632feeee3f398d9518215be2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.56/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "a2b643b639fb26d27fd319db95a359959f7008a0f4b3049559aa790c0fa34f2a"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.56/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cf94ad0d177984a1bab6b14221066de8681963f262e656b2a1c81a2efba3351f"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.56/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5b743c3a2ea301c24ab5ff5258a8b8c087ce7182c0434ae472b978f3d9eeb828"
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
