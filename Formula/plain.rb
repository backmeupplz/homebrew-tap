class Plain < Formula
  desc "Compile, test and deploy EVM smart contracts"
  homepage "https://getplain.org"
  version "0.3.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/backmeupplz/plain/releases/download/v0.3.1/plain-aarch64-apple-darwin.tar.gz"
      sha256 "0ad08c0bc1ba100b5b448dea464c37f4e468c57cc1ef4bab9c8f536800405cd1"
    end
    on_intel do
      url "https://github.com/backmeupplz/plain/releases/download/v0.3.1/plain-x86_64-apple-darwin.tar.gz"
      sha256 "461744204745def4b3bb72f209d0c5898989c7cef10cc208472181f3a34c25eb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/backmeupplz/plain/releases/download/v0.3.1/plain-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "39c8fd44bbd0d3cdaf5c6aa9f0975628b70d71c0669c24dc2b7d44edef68b6f8"
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
