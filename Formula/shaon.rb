# typed: false
# frozen_string_literal: true

class Shaon < Formula
  desc "Automate Hilanet attendance, payslips, salary, and reports for your own account"
  homepage "https://github.com/avivsinai/shaon"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/shaon/releases/download/v0.10.0/shaon-x86_64-apple-darwin.tar.gz"
      sha256 "63628842fedb67b0b2710c811d74d138a6a831de9c1fe9b89b444afe2f11a27d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/shaon/releases/download/v0.10.0/shaon-aarch64-apple-darwin.tar.gz"
      sha256 "10d74676b30098cff68bb82370daad3878e399dc54f5379bea7f47cf80638cca"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/shaon/releases/download/v0.10.0/shaon-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ee0b4939460a5edc794c91660178617919cc93d09a31e8c571985c6ae8a16eaa"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/shaon/releases/download/v0.10.0/shaon-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6b8a6f1966711ce12fa3e7d1e5d59bc85e09c657a84207f1c8df3d1b488d1565"
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
