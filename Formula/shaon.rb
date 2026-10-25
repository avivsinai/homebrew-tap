# typed: false
# frozen_string_literal: true

class Shaon < Formula
  desc "Automate Hilanet attendance, payslips, salary, and reports for your own account"
  homepage "https://github.com/avivsinai/shaon"
  version "0.10.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/shaon/releases/download/v0.10.6/shaon-x86_64-apple-darwin.tar.gz"
      sha256 "488d6368f47dd2ce17845e2df62a5bd62509884f21b1dc0d4ce8438f1fbff40f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/shaon/releases/download/v0.10.6/shaon-aarch64-apple-darwin.tar.gz"
      sha256 "b426db985107f316ab654c3610d6fd4ff358a5144ac4e046d05b6dffabc1b976"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/shaon/releases/download/v0.10.6/shaon-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "375bb56cf6df64b824581b107707270027e8250376f72a3a7a95ce8f31dc9336"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/shaon/releases/download/v0.10.6/shaon-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9ebb1c8c327a167529649a062de315f5363ed85abff69df5e15cb45a03956c7f"
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
