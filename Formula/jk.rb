# typed: false
# frozen_string_literal: true

class Jk < Formula
  desc "CLI for Jenkins - GitHub CLI-style workflows for Jenkins controllers"
  homepage "https://github.com/avivsinai/jenkins-cli"
  version "0.0.13"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/avivsinai/jenkins-cli/releases/download/v#{version}/jenkins-cli_#{version}_darwin_x86_64.tar.gz"
      sha256 "10c66a2c72704315b21621339adfa571dc1f463cbc5ca67427b66c18163e5689"
    end

    on_arm do
      url "https://github.com/avivsinai/jenkins-cli/releases/download/v#{version}/jenkins-cli_#{version}_darwin_arm64.tar.gz"
      sha256 "1e97c0fd85624cc26e6bdd056fe537f7e6a5a7fe3747bd1114b86d9507d65cf5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/avivsinai/jenkins-cli/releases/download/v#{version}/jenkins-cli_#{version}_linux_x86_64.tar.gz"
      sha256 "be8123915e938324378de39f06c94480b87971a4d7f2b213952a7c99e4e05173"
    end

    on_arm do
      url "https://github.com/avivsinai/jenkins-cli/releases/download/v#{version}/jenkins-cli_#{version}_linux_arm64.tar.gz"
      sha256 "1171da3b6616a057b441ba1cb8c64be35c20475ebb857d9db6fbc6a4e9f78130"
    end
  end

  def install
    bin.install "jk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jk --version")
  end
end
