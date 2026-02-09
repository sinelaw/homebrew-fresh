class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.1/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "8bef2e556be742240ab6c9f858f1024e6187a7656b4c286472bf74a66059f02d"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.1/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "35c6c84adb9dfe460e321aa5495edc1b1d858e78663a8fb2e6baa87ed92eeb59"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.1/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "ceb9cbdba957f710b1d2a52f98102dc90318af3544968b90f6573681bdc485e8"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.1/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "39705cccb1e6105ba41172820feb49514cf3a40467dd3ee5efc0a82c02ca9e6c"
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
