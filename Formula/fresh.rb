class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.69"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.69/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "6063ff6afba66a7c9ab784cd42741d1ea9522a45dac4afd5acd7489129c38aac"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.69/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "f792fdf9e96062391f5298252be90f434e69692736188abdea9c45057640eb27"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.69/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "d71b154b8ab725cf2d947f30c7c0d0d374ecd6a62aaed8aa7ef4121cb347cd74"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.69/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "6a26cf323dc08f97743963d7531000b025ef605c3798c668eb96efebae6e7509"
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
