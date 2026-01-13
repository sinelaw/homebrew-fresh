class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.77"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.77/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "fecf9c26c2a6fa467b579fe4128bde56aed3227427bf5a0f97defa3a576a4935"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.77/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "2ba941387441a407ca15c280dfe38bf24f56c8e05f8441a1286adfe2ad58f391"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.77/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e047d886c3e77cc3c8008a9d33fc61b080a40fe2733b2c3cdc33621e9adf342f"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.77/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "8c6f7728b90d33aa85061f2d4239197a679dce3585e9edee40f8451741c6e05b"
    end
  end

  def install
    bin.install "fresh"
    share.install "plugins" if File.directory?("plugins")
    share.install "themes" if File.directory?("themes")
  end

  test do
    system "#{bin}/fresh", "--version"
  end
end
