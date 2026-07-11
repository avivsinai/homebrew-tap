# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.33"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.33/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "1a623366431b233da36585a1bdf0e75de8c9d221e4cff2d77e0182ac072f571d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.33/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "99e1a1ef93158781a8c51b092659073c2589aa5c17dbb719982ab7348d4edd37"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.33/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c10bfd05f2e2441b3f221722528dff72243db6ed1e0881b9e9e43e5e18d595b9"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.33/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4dc23fb01f487470951b31bc12ed51e6b215c29171ae5f6db2db82ac7a708a46"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.33/yoetz-chatgpt-native-extension-0.5.33.zip"
    sha256 "f1ba6f896e09a0e85bd1b8076c4bfce2429050a52ace0f771be4c25b11389cfc"
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
