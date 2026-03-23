# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.28"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.28/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "a82dfa0c4580565dbc9b31fc004f92ad65a261c5ae14cfa78181ce9c10591da5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.28/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "61cd6c95432c1385f92f1370637dddca8b7c4f15e200dd8e91488ad707ddf8d6"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.28/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7451edf6f84a659b69876e7326f0b58be8fa48c108b04ed349612bec063b5db1"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.28/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ead5c4f7ed06fd2349975acf35cc3601e748a8f0d927cc4824068d95b450cad8"
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
