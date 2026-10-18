class Plain < Formula
  desc "Compile, test and deploy EVM smart contracts"
  homepage "https://getplain.org"
  version "0.3.2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/backmeupplz/plain/releases/download/v0.3.2/plain-aarch64-apple-darwin.tar.gz"
      sha256 "745f657e9167a3f8577b198d1ca428a4ec5cb6a7b876a041312d44e9e1780252"
    end
    on_intel do
      url "https://github.com/backmeupplz/plain/releases/download/v0.3.2/plain-x86_64-apple-darwin.tar.gz"
      sha256 "93ff71a317129e2cd1af8cb18b16bc0ca1c418791db4a47681fb3c1b8d603bfe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/backmeupplz/plain/releases/download/v0.3.2/plain-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9efe4982a314623ae0f12d7b86c24039163f063f899ed9c509ab9a94fec26793"
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
