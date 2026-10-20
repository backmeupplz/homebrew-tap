class Plain < Formula
  desc "Compile, test and deploy EVM smart contracts"
  homepage "https://getplain.org"
  version "0.4.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/backmeupplz/plain/releases/download/v0.4.0/plain-aarch64-apple-darwin.tar.gz"
      sha256 "3d3c3426c265729b4af8a64cf9020325ab507219b7bea7cc35eaa421adfe70ca"
    end
    on_intel do
      url "https://github.com/backmeupplz/plain/releases/download/v0.4.0/plain-x86_64-apple-darwin.tar.gz"
      sha256 "611738ecb1678cad05da6cd3c62daf454c21324ef11493c3e2e7416df5024b54"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/backmeupplz/plain/releases/download/v0.4.0/plain-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "128e55f95b3b8689c3f5d53ff68be5bc64f676bdd55c3e6150b91f24b949dd65"
    end
  end

  def install
    bin.install "plain"
  end

  test do
    assert_equal "plain #{version}", shell_output("#{bin}/plain --version").strip
    system bin/"plain", "init"
    assert_path_exists testpath/"test/Counter.t.sol"
  end
end
