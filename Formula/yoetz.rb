# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.80"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.80/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "1101ba315e5067da95c302e183dc17f1bda363aabddb87ee1852c2d869120170"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.80/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "69eb33b0d16c3f0fbf6a73e561068cf365f5e385b409f1c9a39cb656f66273b4"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.80/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5d41795998fd8e9b91e4975047e9b4ceeb213c367f1de151f4db797071e9fa9b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.80/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cab2d8bd74dd7e933292aed69e738aac64733f9b6fd992b9bc137ee8666acc11"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.80/yoetz-chatgpt-native-extension-0.5.80.zip"
    sha256 "5d224c1a49117de96c32511fad2f47bd872101cd086a7308b272f22540a31599"
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
