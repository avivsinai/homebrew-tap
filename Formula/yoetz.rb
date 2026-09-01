# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.64"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.64/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "117e0bb6f64e354c23133c4677a4b0feabec5ac6ccbe28544de9502e69581a66"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.64/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "488efcf58100939850e5b0bbd887cf8d44da0f798ccc665c3651a0d596f210a4"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.64/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "114b0400e785c5032740880787992c1fbaf0558c2594f0f8da661a0a8963bb07"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.64/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "45fdb26b49fbf429f813eee9f093be9a2ebddfd6fa9694c967428fbc15e9fec4"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.64/yoetz-chatgpt-native-extension-0.5.64.zip"
    sha256 "ef24502024b0d6836dd74f1aeef3586f9b985a6a161457730f83323d16573453"
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
