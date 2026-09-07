# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.68"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.68/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "49a013a151613fe5f28262216d963d138ddfd8d57598942759ae94ba9ac022ef"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.68/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "fcb98425864f3ed18e4c2f5a07493ff26850b16687d109979074735b934f21bf"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.68/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5c26bbcb35068fb3298127c8e35fae58be28354c7f505ceb55f3fb76c62649a8"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.68/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c58c1c9ae877a1f8a707701805974e343b427b86b23c9031603d81ed28a60036"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.68/yoetz-chatgpt-native-extension-0.5.68.zip"
    sha256 "c986bc967bbcf00f5a98f534a538388194f5940924836346394d27303f836e57"
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
