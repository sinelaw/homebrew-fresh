class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.74"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.74/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "955c303ed142c7a06c3e2977d6134310f3c02e1daa927bb4f2c7b1830b18382c"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.74/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "26c7f68f5c13334c5504b98f937bb3225395f716b65ea97baef10750cb9d5202"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.74/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "3ce255aaa7548ab081ed38a95df2ea62ce0aa27840b02e2556b2dd418e815a56"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.74/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "80765850469fd6bb2148ce5b4e2658fffe9e78125b1203f8a71a0e4c5514742a"
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
