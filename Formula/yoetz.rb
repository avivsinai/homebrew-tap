# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.23"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.23/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "689389dc4d098d8633697ad8c0ae70122d876d6538b194d2f710f74edb651a69"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.23/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "23d4873eaf295d4cfbb2d8dc5b0706d6589df4f4573a1ee4b5f21f705b2cc570"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.23/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c12052c59df3f2e61a9c4394d930e3302581dea3c1f80cf2888cfc3218b28e60"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.23/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "adbe058618dd6e4ef20c7904edb5dd30b5dcaa23ec4316e8b8836e1714872c43"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.23/yoetz-chatgpt-native-extension-0.5.23.zip"
    sha256 "78b209bf6da142f3a83a58bed2101f3947f2219555aaf1080eb86d243387ef6b"
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
