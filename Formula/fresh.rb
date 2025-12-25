class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.63"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.63/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "d3804d6d26cc0b0122f715b6d446dd9f144cd7308a5b4dd3086e3db4b1314766"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.63/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "ff04d11eff0782a1993f5b73bc82faf72686d473a4be19699be8a88d0bddfd4e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.63/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "cacd769ca264234d7b8e2bc6caee7b75187ef2a68d4ac8d81123fb710316e04e"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.63/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "6dfd38801e993286a62375fa4ee1f6a7cd87bb3a71f22542a19722d70255a4bb"
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
