# typed: false
# frozen_string_literal: true

class Shaon < Formula
  desc "Automate Hilanet attendance, payslips, salary, and reports for your own account"
  homepage "https://github.com/avivsinai/shaon"
  version "0.10.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/shaon/releases/download/v0.10.2/shaon-x86_64-apple-darwin.tar.gz"
      sha256 "d464fe1ce1ffa6b8af60ce36bd292a478b1f704718c5d9d742f4ce5d6aa36f3d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/shaon/releases/download/v0.10.2/shaon-aarch64-apple-darwin.tar.gz"
      sha256 "90fdd18706905f7ad5e633d52ac41e0f3fcbeca098298692c25710e315539e3c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/shaon/releases/download/v0.10.2/shaon-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "27fd8c00b222450fbc6bc6eb60e6320ac7edf36357ae805aeeeb74c4d9616d76"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/shaon/releases/download/v0.10.2/shaon-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3e570e7e2b77c2fac2a95cdd3a3f1239bc1928e6c881d56ce268fe9b5c5ca68a"
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
