# typed: false
# frozen_string_literal: true

class Shaon < Formula
  desc "Automate Hilanet attendance, payslips, salary, and reports for your own account"
  homepage "https://github.com/avivsinai/shaon"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/shaon/releases/download/v0.12.0/shaon-x86_64-apple-darwin.tar.gz"
      sha256 "a57f7fdd64a5d82d4e066adf19a80d335d95c8eff74802b1b1f6aa251b994491"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/shaon/releases/download/v0.12.0/shaon-aarch64-apple-darwin.tar.gz"
      sha256 "15a878a7be7d1eac4fd26919f24f597d888a24a27d7fc44b78a15dcef050d2eb"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/shaon/releases/download/v0.12.0/shaon-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2724b07b592f23194e6ca4947023914ac219dc422b952c5da68d9be055ef5ddd"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/shaon/releases/download/v0.12.0/shaon-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ae75103d76144a3b9c7a4010026a786164b609d6fc98301a5a67e8902959ebe7"
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
