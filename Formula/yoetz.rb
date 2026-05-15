# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.8"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.8/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "76c49f72ae6418f67f3aafcb349c581b64c75a99dd197a5207150debd8d08b25"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.8/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "699e5f439d8c0767d1caea83f62f03950364051b245485f523ea1902e46b7210"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.8/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bb2ecc0a85aad3ae95fa57604a6291d6bb145e87f5e56748cfc768aea8efa9e9"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.8/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "74fb0449ec8f5ad50b93611ca041d4cbc93a69276f2efcc9b0980cf7c941f1c6"
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
