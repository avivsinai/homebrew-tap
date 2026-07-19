# typed: false
# frozen_string_literal: true

class Yoetz < Formula
  desc "Fast CLI-first LLM council, bundler, and multimodal gateway for coding agents"
  homepage "https://github.com/avivsinai/yoetz"
  version "0.5.34"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.34/yoetz-x86_64-apple-darwin.tar.gz"
      sha256 "d0201e4d66150ebb8bfdb17d804e67b7b444dff14af956abfc3a132f92ba6956"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.34/yoetz-aarch64-apple-darwin.tar.gz"
      sha256 "d847f85488f2477b86d99b15508d73fe641e6f0774f811a2286cbf98f3bfe450"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.34/yoetz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "08ed7143541fa9d4b21df8a0ca0ab7b15edcc5fd37ce89ad0d85fd57f261be3f"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/yoetz/releases/download/v0.5.34/yoetz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f4e7b67d76cdea973477e15a414490f701e8de0506ee7288793d656ba63cd4a5"
    end
  end

  resource "chatgpt_native_extension" do
    url "https://github.com/avivsinai/yoetz/releases/download/v0.5.34/yoetz-chatgpt-native-extension-0.5.34.zip"
    sha256 "3cb403a2f765699f0187b1037952678b01139ab476bab3c3b76041537fa0d5b6"
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
