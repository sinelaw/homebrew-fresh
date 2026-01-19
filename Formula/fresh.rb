class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.83"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.83/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "c44b9f99279218bea8c07dab8e26ac322d639745fc5da59c518254769a1d7b1c"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.83/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "ac0f62c9a78e1a97a51fefd642d2fa7c95c3d0ea85ff4c3309c870d9cfbb1631"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.83/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5f550166e50b02555daaf46d64e6890b58bd3b86b6d1845f51a265c57a529e13"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.83/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "787fe24d85a4b9f2218ff5eb5160b846b958a0700b96cb181a3323948802c5b0"
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
