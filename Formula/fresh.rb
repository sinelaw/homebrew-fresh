class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.64"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.64/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "e97a399c6b487097e145d30b5c9fbcfe8d1a5ef57c914ceb83f72fc085863a44"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.64/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "93cc9a729dfa40b747df03d38b0cc93c29e70528354a0625d42f063362016627"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.64/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c10055a9219b508ddfddb98966d1080b2c1d82e1c5188ddf184cc18b47670a7d"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.64/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "ce8188b9190a021ada5f7343d1b4f8eaaefe29edfd637c4b40712bd3bb4ae052"
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
