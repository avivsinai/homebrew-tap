# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.48"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.48/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "ac1f79be1244aef628dfdb196033c63c7729edf90c94e30ea89d7e03d4a7b22c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.48/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "35c893d710ac6fe47d34919d9af3228eda273089fcb61cea80dac21d08d5657e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.48/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3ae1950f307588820d9e16b6dcfa75fcc81b6ae061f44a020fa30632b7eae210"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.48/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2c85af0ae413627c98364d505631385aeaef8ed54a0c4672277ff558a7177729"
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
