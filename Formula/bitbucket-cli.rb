# typed: false
# frozen_string_literal: true

class BitbucketCli < Formula
  desc "CLI for Bitbucket Cloud - manage repos, PRs, and pipelines from the terminal"
  homepage "https://github.com/avivsinai/bitbucket-cli"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/avivsinai/bitbucket-cli/releases/download/v#{version}/bkt_#{version}_darwin_x86_64.tar.gz"
      sha256 "011d5b81dab19baba933ed05837e9d9209571b8bce463bf695c090e1fb841f12"
    end

    on_arm do
      url "https://github.com/avivsinai/bitbucket-cli/releases/download/v#{version}/bkt_#{version}_darwin_arm64.tar.gz"
      sha256 "9e82c86926734089d15602612bdf8db120f77d2ea15990ae630765caff03ed66"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/avivsinai/bitbucket-cli/releases/download/v#{version}/bkt_#{version}_linux_x86_64.tar.gz"
      sha256 "cf5649099d0225cc437025802255dfda620af16b36eff4c102d59f8a7258eea1"
    end

    on_arm do
      url "https://github.com/avivsinai/bitbucket-cli/releases/download/v#{version}/bkt_#{version}_linux_arm64.tar.gz"
      sha256 "2baa15f0030e9a17f2ca41915a4f2ae91a5a210642206ee8b0f7032edd462648"
    end
  end

  def install
    bin.install "bkt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bkt version")
  end
end
