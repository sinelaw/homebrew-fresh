class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.42"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.42/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "d399eb307809322322639ab43f13b2c7a4873b3a56bb325648b59c5d5006ad5f"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.42/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "4058740689239338a02f8893213a2f09907f36802155d055a5afc93acfd46429"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.42/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "9adc98c2c66ffd44bfb7c773c35241a4e8571870317788fb00cf8363c5c3539e"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.42/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "d580069c32b7df91e1d632a3aa4db77a2d591b100cfb6ca52a40a3037876d39e"
    end
  end

  def install
    bin.install "fresh"
    share.install "plugins" if File.directory?("plugins")
  end

  test do
    system "#{bin}/fresh", "--version"
  end
end
