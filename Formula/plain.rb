class Plain < Formula
  desc "Compile, test and deploy EVM smart contracts"
  homepage "https://getplain.org"
  version "0.5.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/backmeupplz/plain/releases/download/v0.5.0/plain-aarch64-apple-darwin.tar.gz"
      sha256 "e2d582be8cb015f31e3c678476160a7bd08c32f4b11f687c26b0a4bbf475e2ab"
    end
    on_intel do
      url "https://github.com/backmeupplz/plain/releases/download/v0.5.0/plain-x86_64-apple-darwin.tar.gz"
      sha256 "c7d1cbd9b1ca8f35ee0fc8e8a9e0647f3c5890d7848531d1c57d4c48e6281988"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/backmeupplz/plain/releases/download/v0.5.0/plain-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "677550a42c7b240d9b678ce82fa23e6bbbd70dd67156d8068d9409c61a071bff"
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
