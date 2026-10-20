# typed: false
# frozen_string_literal: true

class Shaon < Formula
  desc "Automate Hilanet attendance, payslips, salary, and reports for your own account"
  homepage "https://github.com/avivsinai/shaon"
  version "0.10.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/shaon/releases/download/v0.10.1/shaon-x86_64-apple-darwin.tar.gz"
      sha256 "23f84f0205b77074ec43923d4dab7b2de64172dd8c6e12d984e4ebaa02a3e7a7"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/shaon/releases/download/v0.10.1/shaon-aarch64-apple-darwin.tar.gz"
      sha256 "96e334088aeb75c0d14193ac43fca5e02cec32766e850eb140942e17c7bfffcc"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/shaon/releases/download/v0.10.1/shaon-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eb9022a2142acf4cbdc1f61dcb2e2cc14404658b083ace15e34bf8197e74c382"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/shaon/releases/download/v0.10.1/shaon-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7b2fa01c78eb8742e02659c44bea43abaf2661649b9dec7e166439d4d9d58f7f"
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
