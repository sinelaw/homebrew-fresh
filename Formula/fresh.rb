class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.3.5"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.5/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "c2fdc8531ea0a30aacfc9ad6168eaafff2772f4023a0878bd680a8fad35881ac"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.5/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "3fba2e92b7168e321367b658ed4e61881f1f6ecdc96b6294dbbf7aaf356e675f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.5/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "730d7932e374e480ea0608d526e968829c89975fc9ea45940d54ed94ab4f0cc0"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.5/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "51b3d6c6e09590aef9e986bb40dd531a123c691e63175fda91c1dd59a2b1efd3"
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
