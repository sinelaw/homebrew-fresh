class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.2.3"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.3/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "b495b84b1c077d840706c3ab500e15ccd2df98cc7822ac1e26d7b38cf1ccf473"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.3/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "54f5527dd4902202ec21edf30a0b3aea751c286a638c6efcf36baa1acf66ecfa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.3/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "2df86f148af49509ed2b6c03761a35a131e0d64f74068c95b46c460d46594e4a"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.3/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "49c56e6ab07281484685bf2f54988ebd2a600ad6abb0458ff14e983b15339422"
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
