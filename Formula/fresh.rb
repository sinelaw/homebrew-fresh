class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.2.24"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.24/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "80aebf1b1eaf56a869cc595ec19b3bfd43fccfbcd68fc58dfa4bd9ffe2491558"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.24/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "04afd96f0b14602f818ff9ee23dd0e5d8b162f634823993027780bee126f346f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.24/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "d79f03cc423cc77106480cc7b39cccace2c834d50151ae61f0e9fb2c9e31665e"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.24/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "0c450bcf836c336dce835c8fa5d0e4ce1f2a28bfe2d7c0d0e4357bb382670100"
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
