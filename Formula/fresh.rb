class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.95"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.95/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "4e7f3da50e477f583fc10e4792f2384411b48f549299397a55bcf3e41c2a2d11"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.95/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "b5e60f94801deef8723c0c3d7e541eddb9f3f15a80f6f293260be2a00312fb98"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.95/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "27027688b7292f15a34697eefe5b42eda227bacdf86fc5567209aed10747131e"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.95/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "e7362ca7f93e03ae852578843af5d66b19615ace288615afbcb805295214eeca"
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
