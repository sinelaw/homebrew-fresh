class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.2.13"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.13/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "2f7375396a3a942222691d3cbb577fa2849b1b9276c29b21adc536b67787e5c5"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.13/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "2c831d1da274104fd62aabc6e8bed8bda6e1ae5d52055037ff5ef9d2a4c6ad7a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.13/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "29841e14aed8d99e47fc88f89110418fa6ecfa0a12d00991759f3c934a4e72b5"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.13/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "164d3748ea0cbb21dab47eb61982817c9481dedbc9242bf596ec40bb8e23911f"
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
