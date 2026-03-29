class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.2.20"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.20/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "07e67f6a07583795f4ecd57b808e1b361c8059a2bd423dbae3da3d3ef075dc6e"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.20/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "cc73ae7f047f7a466a6e6bbcfbf2dd45d5b1b29f54fd213dc5db0d04577501eb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.20/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "69887f34124983fd61c780e1653d0594e6f5cc5ba92ae3c5523282a00f59a61e"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.20/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "8237c4ac11ed1ac52a1c3abaf0a3b5c393b782b83a3049609884d5d130122f79"
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
