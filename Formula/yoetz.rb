# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.17"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.17/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "ec02b5e83e1f543d0c0acd6f606695276428cbd505790b1c9fe0356088900fa5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.17/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "6cbd92498edfd88aa5c59bd58bb09ef4d9783869335e41b3c944a912f8550203"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.17/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d434ceb78f5f15bcf105886fec51781b63c97bd37c23f7d969fe719bec858ad6"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.17/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a1045368fa79e390c71323b7792871d0b4c2ca73404937c4dc15c37874258596"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.17/yoetz-chatgpt-native-extension-0.5.17.zip"
    sha256 "dab98bf550e5f17e815b475d402e021afbb12750f932a984024237eb548be2a0"
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
