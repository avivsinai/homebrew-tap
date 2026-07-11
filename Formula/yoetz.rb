# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.31"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.31/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "943a48d349030fdbfbba934fae427db66ade4ebabeff474a11abbbf4dc4b0a32"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.31/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "1223c6b2f0e65c36089c62f06ba695b4fc7b6b0cdd7c2f119594ca49b9fdd571"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.31/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dc98af5e100da21e1c8cc58eb324467a3aa5f76fb2f74b97643a387ac6491e62"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.31/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a44459b4739689fc1e02d7fe552ff2291d74725f9722cea8d999353fa6ae7311"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.31/yoetz-chatgpt-native-extension-0.5.31.zip"
    sha256 "d9d7a1b68a7ef02dca94f3f9fab923a322a69a73f2401a83db79cb4ffe6de824"
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
