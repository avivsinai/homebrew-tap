# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.51"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.51/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "2892dcb3d3b80a46cce90627185d28107ef4ead3f4cf9454e9972c42b93625e6"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.51/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "9a85f5dccc1136e1514be90ffa33d0710a0e17b93a548d119d9a1cce44440ad4"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.51/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "19fef28f805fd58aa2128bf054706b1c430ab7954203369cc2e359dd56dbbc11"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.51/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7c1d7299dfa723d0e4138f25d5b47655aaee381250c84d3b870958ad8142df77"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.51/yoetz-chatgpt-native-extension-0.5.51.zip"
    sha256 "bfd98d33a6d449b2425444379a99c4745afde4cfc271f82e68ce6b0cf7273c01"
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
