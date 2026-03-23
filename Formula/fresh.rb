class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.2.18"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.18/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "f76e08a4af86d250536e5b6873e330f41c448f386e48bf4329a94aeef5b168a1"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.18/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "1ac9a620e2deb3626e4f4a6a5df477866e3646bc4e64de7999af930cce1a874d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.18/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "2adf368b20716dbf3c98734b2035d451c85556b39f2e248811bed4f38528b6ad"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.18/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "05ee2a39722d2d2004ef12c61cc91622d5a5a2849f217862a6a2e27f111e9613"
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
