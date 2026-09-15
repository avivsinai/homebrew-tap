# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.74"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.74/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "7a4ef6c69aaa94088df613e354791bba0d787695d36ee1afdc4639255fcbbccb"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.74/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "7c709bc151660bd99316d4a38dd38fbb232a1c077e83c6d21ac1f857885edce0"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.74/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ce0a34cc338533460ca09829b1d4a235487b387d7b7ef11891697c656904aebe"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.74/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "17d116d0432c91387224e760be6885a71d817bdf61091ca8ab8b062c478d4b35"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.74/yoetz-chatgpt-native-extension-0.5.74.zip"
    sha256 "8f829a7dec367079d21e78816438a5b60c159273b6b832c91766d62768ea2581"
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
