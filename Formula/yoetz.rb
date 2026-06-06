# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.26"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.26/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "2a85e6d7315cd93eadcd8b0aac2d7006b23037dbaf79cba1a379bdc737a06c9d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.26/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "27097d642981f499fb6a06b7349faccfbcb2b24b3cb45af0b90cc7144aa603a4"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.26/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "41868377daa5cecef28423b9a919ac6ff7235c2d95b8b2336cdb42145ff8c112"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.26/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1565fef47baf462bb71b6fe747f52b1f364efea9c20760e7bba6db2fdc8fd6aa"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.26/yoetz-chatgpt-native-extension-0.5.26.zip"
    sha256 "25a8172614f0900d7ac9426ac9e00de372595dcafaa262c9ea06a5823a194911"
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
