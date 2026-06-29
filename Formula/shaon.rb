# typed: false
# frozen_string_literal: true

class Shaon < Formula
  desc "Automate Hilanet attendance, payslips, salary, and reports for your own account"
  homepage "https://github.com/avivsinai/shaon"
  version "0.9.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/shaon/releases/download/v0.9.2/shaon-x86_64-apple-darwin.tar.gz"
      sha256 "d43671fbcb0bb98a56fd8a4ca37a01cafa22f7128fc3e693259d256bf1ad2b09"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/shaon/releases/download/v0.9.2/shaon-aarch64-apple-darwin.tar.gz"
      sha256 "777e46e32c056b823d135dc42d661da2566c271771b8ec1d09950e92f9d08fd8"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/shaon/releases/download/v0.9.2/shaon-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d88c4072feb79966ac456369865a358ccf6e42db484764d594ac9bbcc54a44a3"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/shaon/releases/download/v0.9.2/shaon-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7d1fb41acadd221be7b8ef67ad2a44653ffd5b49dcd7fe0e640434ea5e52f244"
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
