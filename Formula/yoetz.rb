# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.54"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.54/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "06470b1f88b556e790b9265120d72c8aa3ab6e735b1ace6b8297299dfee8bab3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.54/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "47163d3e614bd6e7456e907b5d22e5bf1e17cefcddc9045ad85d8d86f831b977"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.54/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3fe72be2527274d9f671503ee2886529f77950654ebe6f14eeb3af0267e1c11f"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.54/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7c4ea2580b58a4546a037048664f95e139c1036ec0733ff452d5b594bd309887"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.54/yoetz-chatgpt-native-extension-0.5.54.zip"
    sha256 "2daecbf3d7ea795e3e19eb3d79bdfdda6493d0df54f48c597e32c7ac1e452b21"
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
