# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.72"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.72/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "649330673c920b9d8082e3807415509f6ea4570839f11705d44c3e555a1bf686"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.72/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "70129111d4fa38228f16b5236ca5176c5926f36163e4e87d7b40f4fff1954277"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.72/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "126c89027a83ae2abe38e57de9674e13949c676e91b1ae607ac399ee31ca42c7"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.72/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e324bedd9741d4ded603153f0299ffc2af4807a33fb7920f6d6f02d93d8efa23"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.72/yoetz-chatgpt-native-extension-0.5.72.zip"
    sha256 "721ddc7df8a5678ec17d20e1f00f7a6f61a7d44d32d50ac1e8001711e5333e2e"
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
