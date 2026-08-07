# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.49"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.49/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "d9ca152ca1bdb12a9697242b6c7fd4d9dce897256548a12094be78dcaf478702"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.49/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "fa98ac69c9a12d15bc7f009bd3d962f9191784e989ad9650b0fcff945e426017"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.49/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cdb0f843919b99845fa0387112cb2155ca6ab5415fcb6b5f56ab2e5730c29558"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.49/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "95c97b238ddae5977ddaadeda7e4d8ab29b6ed2f83ae532414b647cc98f0f30c"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.49/yoetz-chatgpt-native-extension-0.5.49.zip"
    sha256 "29b09a99b3df293e87d6d04ea46e5314e29c9cb1209570ad8f1777a86d392c2c"
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
