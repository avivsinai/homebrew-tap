# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.52"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.52/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "959acb85c0772758d6c07ab227eb26567d3c1d5ccafe2c50a2cfc4f3a80448c7"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.52/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "0d43de626b31f60a01eb81af1311a6d8c5b860b3e3c4dc4fe4ac28b290ad178c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.52/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "db27fb53d4aa57a80ee6ba10831bc052079c27ab2421f5f599a6093e8104a587"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.52/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2a2db10d58c9cac717ab9d11a740dea7a7cb20eda38865d2a34d0f557a66ef23"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.52/yoetz-chatgpt-native-extension-0.5.52.zip"
    sha256 "22ee2204ab70c214fbe84c019ea2a8e78166a9665a8e1f15e13be85693d5072e"
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
