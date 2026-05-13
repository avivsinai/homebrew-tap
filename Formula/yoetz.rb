# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.2"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.2/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "e883ff61cb2e5054ea165ed588e22cad907bf8337cb6dcdf97e37ef9c0162bc5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.2/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "9563f943ac92c1195cdd875d8ffa3aa1632c87fdc93d088d3732b2eb2ba4a1aa"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.2/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "62710a6e86a5f7c5bceb6ee934d140237a99eabeb748b941887b1207bda9401e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.2/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "75f205ac9cefa506af3f76bb74362dda094526115bc1f02444cc975a9c609b70"
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
