# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.82"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.82/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "b3affa35ecab480722419689e05196bd0c020070a9de871b24590ab2937240ba"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.82/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "5ac04b54fc5d18aad388334178dbbdf9c10dc920e789f6d0a2edb11ed0dea8f6"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.82/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5cc8baa490e610e856139fec43a800ffb91f4dde3082c8d3f8ad949917c81dd2"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.82/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "111a43740eecd7fa2e4a52da43a41e981f9aa0e5d4696d1d31a15996c4720fcf"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.82/yoetz-chatgpt-native-extension-0.5.82.zip"
    sha256 "31e8317753e9f40566158de7cf887030e0093ebbc80b475d8ac3b436662c194d"
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
