# typed: false
# frozen_string_literal: true

class Shaon < Formula
  desc "Automate Hilanet attendance, payslips, salary, and reports for your own account"
  homepage "https://github.com/avivsinai/shaon"
  version "0.9.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/shaon/releases/download/v0.9.1/shaon-x86_64-apple-darwin.tar.gz"
      sha256 "bc85f556e92e1a6e7f870753533a70211e6e8c0c0227faee40bfe286c6f6e29c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/shaon/releases/download/v0.9.1/shaon-aarch64-apple-darwin.tar.gz"
      sha256 "827016946b3705d61dc46244b724037dc3d2ad398418d2dcbdb34ae4c6c05a32"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/shaon/releases/download/v0.9.1/shaon-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "376dbdc9667eacc7379772573373e7ceb85f1aecce9d8c4f2fa77b6654d24aac"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/shaon/releases/download/v0.9.1/shaon-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7d96aec57167bdee2359ed9529af9218d0cdc527708816755e45c4ce2bef81ff"
    end
  end

  def install
    bin.install "shaon"
    generate_completions_from_executable(bin/"shaon", "completions")
  end

  def caveats
    <<~EOS
      macOS may ask you to re-approve Keychain access after upgrades.
    EOS
  end

  test do
    system "#{bin}/shaon", "--version"
  end
end
