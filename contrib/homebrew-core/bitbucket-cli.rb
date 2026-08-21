class BitbucketCli < Formula
  desc "CLI for Bitbucket Cloud and Data Center"
  homepage "https://github.com/avivsinai/bitbucket-cli"
  url "https://github.com/avivsinai/bitbucket-cli/archive/refs/tags/v0.31.1.tar.gz"
  sha256 "90fe0d9427276df1e3d26615810dbbe1b2c1e4a582c053bff981de90ddbdb994"
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
