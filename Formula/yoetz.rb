# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.35"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.35/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "2d163a598bc8ab53ac80b30bcdf918f4fcf14bd0801aa05f674b8ad23e74bb9f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.35/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "b4cb97c1b5caa55ec06e65c4a588ee8a508bafb63629cecefed9e352d2047bdb"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.35/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cb82e79dadc31378441e3928507cef135b07e47bb3272a6356856474412a0b23"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.35/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c863ca3b77232c616449b2997c55481b0f9127d461d6289b52f5bf3bd824c8bc"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.35/yoetz-chatgpt-native-extension-0.5.35.zip"
    sha256 "d0b1dc8b599c59b0699a9690824dc0f323a2878b1bb4da0c05b9eae7baa2c88c"
  end

  def install
    bin.install "yoetz"
    (share/"yoetz").install "scripts", "recipes"
    resource("chatgpt_native_extension").stage do
      (share/"yoetz/extensions/chatgpt-native").install Dir["*"]
    end
  end

  test do
    system "#{bin}/yoetz", "--version"
  end
end
