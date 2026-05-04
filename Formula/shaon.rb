# typed: false
# frozen_string_literal: true

class Shaon < Formula
  desc "Automate Hilanet attendance, payslips, salary, and reports for your own account"
  homepage "https://github.com/avivsinai/shaon"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avivsinai/shaon/releases/download/v0.9.0/shaon-x86_64-apple-darwin.tar.gz"
      sha256 "45a9b70d679239580fe56f3a5012a6b60dd5b3325a75a45514138ba05b2957ee"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avivsinai/shaon/releases/download/v0.9.0/shaon-aarch64-apple-darwin.tar.gz"
      sha256 "18bec59374fdc6704a53c508c91bcdcf6e437f632657ddfe34d830a6c0928bf2"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/shaon/releases/download/v0.9.0/shaon-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3531948d96d162409c30dd203b34166eaf173deed5cbcd94a98aa2c4ebaefef8"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/avivsinai/shaon/releases/download/v0.9.0/shaon-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "059d351720af800892c104a9419f81a4bed95837d7ba4b772f585c054fa61d30"
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
