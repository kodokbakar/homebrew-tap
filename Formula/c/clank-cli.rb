class ClankCli < Formula
  desc "HTTP load testing CLI tool built with Rust"
  homepage "https://github.com/kodokbakar/clank-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/kodokbakar/clank-cli/releases/download/v0.1.0/clank-cli-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "b11f6625aa792b7fdcec2d33ee35c1505a013ea364a3fdea45565b00c31c9147"
    else
      url "https://github.com/kodokbakar/clank-cli/releases/download/v0.1.0/clank-cli-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "4d86654bdf3bcda9238f47405dfe8fef866973ce116916f473dd948e3fa155e0"
    end
  end

  def install
    bin.install "clank-cli"
    prefix.install "README.md", "LICENSE.md"
  end

  test do
    assert_match "clank-cli #{version}", shell_output("#{bin}/clank-cli --version")
    assert_match "HTTP load testing CLI", shell_output("#{bin}/clank-cli --help")
  end
end
