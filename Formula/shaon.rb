# typed: false
# frozen_string_literal: true

class Shaon < Formula
  desc "Automate Hilanet attendance, payslips, salary, and reports for your own account"
  homepage "https://github.com/avivsinai/shaon"
  version "0.8.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/shaon/releases/download/v0.8.3/shaon-x86_64-apple-darwin.tar.gz"
      sha256 "40ee634c9bf155c602a55f87103051eba6dc2de407f7eb6ec236e66ee419b320"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/shaon/releases/download/v0.8.3/shaon-aarch64-apple-darwin.tar.gz"
      sha256 "9670e4081c34978da189b7e99ef725c4cb9b732823fe1375ea7f453d9dc25c68"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/shaon/releases/download/v0.8.3/shaon-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "280f22b9d144c07978a53fb6341f3b633343f57e731e100590e3ec391c760ccc"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/shaon/releases/download/v0.8.3/shaon-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dc142c98362947668d2e3b3f81b1b832a9205b540055ea420ff46312a5f59b95"
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
