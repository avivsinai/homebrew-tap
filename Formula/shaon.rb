# typed: false
# frozen_string_literal: true

class Shaon < Formula
  desc "Automate Hilanet attendance, payslips, salary, and reports for your own account"
  homepage "https://github.com/avivsinai/shaon"
  version "0.8.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/shaon/releases/download/v0.8.2/shaon-x86_64-apple-darwin.tar.gz"
      sha256 "1498e2847647a5761187c323cbd8599830795b3613e793c74efe01d1e16b7a83"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/shaon/releases/download/v0.8.2/shaon-aarch64-apple-darwin.tar.gz"
      sha256 "a09d692d532c2c911dbe6ef9a2121df3f8b20ad2c3bca1bc2c5a5e207173357b"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/shaon/releases/download/v0.8.2/shaon-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "96380216d71980b32fe1dc9c2bbfbf83decebb2440ab2cc0711b8f62d723824f"
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
