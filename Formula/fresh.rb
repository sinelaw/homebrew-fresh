class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.87"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.87/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "6a9ba6e8ff6315949dfa0088fd96cdf3c089895a18c1d6477a9731831f5be2b9"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.87/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "9898301b3fe02d022f103e88b8fae3730289d165d6e7b84c38b88f045e24be5d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.87/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e4c571bc67edfcf9b40030f8bee1985acc873fa4a3805594a6aec274b86f7416"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.87/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "b3812f89c24bf392feb57d75e41a9c5c3c7ec37f9786ee289f7741ef5a75e61f"
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
