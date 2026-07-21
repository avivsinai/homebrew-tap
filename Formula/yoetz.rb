# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.41"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.41/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "3b29d0b3702feaa499a1ea77bd7de19401965077b66ba8f806874a29564e1996"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.41/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "fd646937515a27b6f93bbbc5fd53e86123cc34d087dbfec4f5a3d6f1dfd8c13e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.41/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2150aa9b01fe784feb98f061a5c4d17cea73b369e484e23f40e642c3bf1f8841"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.41/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "67d515f3021cbbc88a12fa27f5379b4a01b7e0d3f38bd58e27acc16945a82508"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.41/yoetz-chatgpt-native-extension-0.5.41.zip"
    sha256 "ecabbe353afadc75cfdfd50852afbc999da6c86f8d06f0befa89d30b0557f813"
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
