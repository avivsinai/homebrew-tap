# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.47"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.47/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "7f244452eb317ebb442730d6b9228cfbaa83f41abce485c057090bb01ab06efb"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.47/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "149f2b7e6709364a684a40bf06725ba832f680513b24e8bad5a421f6f3fced03"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.47/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fdfbd7bdae6f9007663f7f46cb1f2673aa7d59d626ee0f803552baa38b19b3a6"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.47/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3a861d916a38729a59c26f2561f413c565a4c42894bfdc6f432ba3f5f1e52295"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.47/yoetz-chatgpt-native-extension-0.5.47.zip"
    sha256 "85480f1429a5c881685c4e625b341c0d7bd25d72777d12095fd6a48187507f2e"
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
