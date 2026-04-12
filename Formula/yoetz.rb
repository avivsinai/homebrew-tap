# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.2.49"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.49/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "3bbeb75c28ef262adb5cf0b772292a88046ae98482f35dd5b892ace00dc23207"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.49/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "b7c010951ad0889b97597af7e7b5e0a6c353ede02bfe8cfeeb89e40d38dc0cd6"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.49/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d511b55d032104f8e6821914549f062801731a5120c5ce4f2f874d277ac18985"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.2.49/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0f48f3be44f194f95714ca4b1f898aa3e05cbaf2ea6d14a420900de11a897547"
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
