class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.86"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.86/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "4a4595c2b7e949601b79736435a875f81d714e855937de5cc4ba38067b24f0cb"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.86/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "9c26a9a33dcdb1e3f63136986827d189eae5165890535bd5247fe9e611b963db"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.86/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "554bbebffcb30b1305eaadaeeafd0764e0b072c370cc9f33e5d511abc172db81"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.86/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "6028cf78488aaf318b5620214baf108a1dbff99000598f429d2ac94a61920027"
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
