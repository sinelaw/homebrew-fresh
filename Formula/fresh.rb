class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.3.6"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.6/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "9b5d1411c87fffe83346bf8c005f332062c142a32960b06d62b23565f7dcc24a"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.6/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "1e7c641f3a7025c2d57eb41a62100049ae766b2671527463356822365747e1db"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.6/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "80a2e5ba96d2118705bfaaaf34f6899965f92466902e9a882f684ebceff4bf78"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.6/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "236ccdb1f8d991d3e448533091d93b1bdbd440bf5e307c8f43e8cdad5e3c8d15"
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
