class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.3.12"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.12/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "04eb9d59c847c906ef0653cbc031c2b980d6923103d4c02fb395de946177522e"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.12/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "08b15e2d6aa6b24c22f7bb87f9d150f1dbf6001b76c5ffda8357b81407ed9af4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.12/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e876bb6c4d81ae6301d3e3bc841da9f20a35a3b2010289c64ebfe61dbc2ef3dc"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.12/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "b38ef8b632f9e956b33f412e2d9b0be3117a440136e657c42bf8505746f2df9f"
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
