class BitbucketCli < Formula
  desc "CLI for Bitbucket Cloud - manage repos, PRs, and pipelines from the terminal"
  homepage "https://github.com/avivsinai/bitbucket-cli"
  url "https://github.com/avivsinai/bitbucket-cli/archive/refs/tags/v0.31.0.tar.gz"
  sha256 "aa4edde1d007db2cc55c43d5558d55181ca7058a1899df16167d610e639c3fdc"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/avivsinai/bitbucket-cli/internal/build.versionFromLdflags=#{version}
    ]
    system "go", "build", *std_go_args(ldflags:, output: bin/"bitbucket-cli"), "./cmd/bkt"
  end

  test do
    assert_match "bkt version #{version}", shell_output("#{bin}/bitbucket-cli --version")
    assert_match "Bitbucket Data Center and Cloud", shell_output("#{bin}/bitbucket-cli --help")
  end
end
