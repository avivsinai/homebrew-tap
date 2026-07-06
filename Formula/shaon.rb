# typed: false
# frozen_string_literal: true

class Shaon < Formula
  desc "Automate Hilanet attendance, payslips, salary, and reports for your own account"
  homepage "https://github.com/avivsinai/shaon"
  version "0.9.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/shaon/releases/download/v0.9.3/shaon-x86_64-apple-darwin.tar.gz"
      sha256 "85ba562e200688fd309938b5377d009374a2eff58a8f21a9305350441a7629c9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/shaon/releases/download/v0.9.3/shaon-aarch64-apple-darwin.tar.gz"
      sha256 "708e9c68ec10a5ac49124ff2162dc0c6f8f4a807abaf4c4fc9c1870e3489685a"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/shaon/releases/download/v0.9.3/shaon-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4ea3ffc468139a530cb686043dddcab9b70b8acbd885eaaa319315c1d8564a68"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/shaon/releases/download/v0.9.3/shaon-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "63a6b2300756f578dc2b35874e037bdfa2fdd300511dcbeddf245ee56ce4bc26"
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
