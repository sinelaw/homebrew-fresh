class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.4.3"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.3/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "f7d4a17213c51259efe960cb53b78a73c1abd78c57c7a69c1cb8383c4bcc8be5"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.3/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "aa5f1a86b6b0071419f09853968e3c9ffee6dcf015f9d8ff89670508a1212231"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.3/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "9475a9f0c79b9465ce9e7df258f818696db36f36fd96ecf73ad57a72d6f71941"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.3/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "c1c911ed76ad352ea09e5b2ca9e57d3affaa18c82414402db9d1a22152660e4f"
    end
  end

  def install
    # Plugins and themes are compiled into the binary; the tarball
    # ships only the binary + docs.
    bin.install "fresh"
  end

  test do
    system "#{bin}/fresh", "--version"
  end
end
