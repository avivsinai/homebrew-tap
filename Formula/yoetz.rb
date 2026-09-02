# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.66"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.66/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "6469da83370f820a0024831a34064f62baab99b34debf3bdf161cdd27e06657f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.66/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "98554ba7a1e22776db4e1b310a2e317e40ca8c3764bf7f22330dcd8e92ef3e80"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.66/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8cc375485cedc88c9ac57c2a775663d241377aa8e9ed4673006750829e36aaff"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.66/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "80777d1c2497d9c9d458db44f8df2312c1cc35172d4cd540c36c48f2e8315c62"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.66/yoetz-chatgpt-native-extension-0.5.66.zip"
    sha256 "9617d737772934c0191c4b662697ddf5c25fdd3c8ed1ea0c48eda96ef38ed676"
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
