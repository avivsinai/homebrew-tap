# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.73"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.73/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "5f06c9c4e9d468ff6c77c77061139d2327744451645b5b45da45e9259db5c977"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.73/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "9fdaff4a5b5c638bf3943965de1c9a27018023e9aacb1f8d3dc8e3ed6ca2c291"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.73/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "149531cef41c718542ed062d49fdbd34a09641c7247fcbb513a6d1a48eef7ddc"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.73/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "350715572c9c70fa0765b0178afa1ef9f6d2bc9841b410620765f581efb55818"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.73/yoetz-chatgpt-native-extension-0.5.73.zip"
    sha256 "17ddbfb9ff9bf0f18219234905496bdce79c61fbcfdb0f5c10111b4a4d18f65b"
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
