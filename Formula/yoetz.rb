# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.91"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.91/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "915675782dd1c185c0e3d26b8e6981761347b85dbfdb3a4f4f399cbff4e263a4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.91/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "7acec9a66e730fc8661279a820810c737ec1a616dc143e9acb14b93f1f078c32"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.91/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c1929749e0b908efdf919afd5409508b8dcf66b7c4ecd86aea152dfc166b4e92"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.91/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0155b54125d6c181aa62c9f5a8936d9fe57358d27310b1e3d6b995ede7ec6b59"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.91/yoetz-chatgpt-native-extension-0.5.91.zip"
    sha256 "9e4b811a561a9f0a2d4aa04a2a16c564b13e9ff9e585d6e42d38602c815483fb"
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
