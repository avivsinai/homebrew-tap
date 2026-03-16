# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.14"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.14/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "f88586418a656019cfbe0f7ba27cfba575f26aef78a82df80182bb4f5a778d7a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.14/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "d373fab3e9896324a2eead0a1b758171e96e44b18a66b32cc1981f1e0b34808f"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.14/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6b74475aef765370e9a7e2b88b5a4431202c24e848a1455c9911b4a021a23443"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.14/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ab78a788656655aa142e924754c698cdc06df72f1238737927692a8e7d906035"
    end
  end

  def install
    bin.install "yoetz"
    (share/"yoetz").install "scripts", "recipes"
  end

  test do
    system "#{bin}/yoetz", "--version"
  end
end
