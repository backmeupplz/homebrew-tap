class Plain < Formula
  desc "Compile, test and deploy EVM smart contracts"
  homepage "https://getplain.org"
  version "0.4.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/backmeupplz/plain/releases/download/v0.4.1/plain-aarch64-apple-darwin.tar.gz"
      sha256 "16b3f46130e4fdf228f5349c34811a36e9c99c631ae9af4a0da09270c1c77cba"
    end
    on_intel do
      url "https://github.com/backmeupplz/plain/releases/download/v0.4.1/plain-x86_64-apple-darwin.tar.gz"
      sha256 "4095505d67247f79de41df5ab4eff79f80632992d3f404cc87277175d223922f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/backmeupplz/plain/releases/download/v0.4.1/plain-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ccf1ed2fa71cb7c8963c0518d10d81c5cae69f20c72fb6bfef126c4b80a4be23"
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
