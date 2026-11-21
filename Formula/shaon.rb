# typed: false
# frozen_string_literal: true

class Shaon < Formula
  desc "Automate Hilanet attendance, payslips, salary, and reports for your own account"
  homepage "https://github.com/avivsinai/shaon"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/shaon/releases/download/v0.11.0/shaon-x86_64-apple-darwin.tar.gz"
      sha256 "e03f539830e2a982d7d7bb56f5974acd3ab6bc70942e9c1df521df1c9a78c0c9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/shaon/releases/download/v0.11.0/shaon-aarch64-apple-darwin.tar.gz"
      sha256 "08e72b8e9778851b6579c65fe3ea2cd80769b871cac49d659952d2e109ac51ed"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/shaon/releases/download/v0.11.0/shaon-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "323d256731fc972eaf2750e1b42c22c3b800bd7fd15226a6c897804877a1b948"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/shaon/releases/download/v0.11.0/shaon-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "91e6f4944c4e6f6bcd6f55cfae41b9a975674fc4a98748aab82bae2045d7c868"
    end
  end

  def install
    bin.install "shaon"
    generate_completions_from_executable(bin/"shaon", "completions")
  end

  def caveats
    <<~EOS
      macOS may ask you once to approve Keychain access after an upgrade from an
      ad-hoc signed build. Developer ID signed releases keep that approval across
      later upgrades.
    EOS
  end

  test do
    system "#{bin}/shaon", "--version"
  end
end
