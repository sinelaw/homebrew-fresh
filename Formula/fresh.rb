class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.3.2"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.2/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "f12483476f7692b6454ecdef48ff0208b38d1dad19628848a1b656513e98f889"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.2/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "5aaebaf3272d931327cd9aaa8f3ba308a656b9da581c87811c45f48d67ede1ab"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.2/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "bc29a47459fe63451b31b3406c671e28acf89fd7a4e66741759a5dc7177c9465"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.2/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "a4a6e8bb22309ac123a69cd39d57d92fe5ee87da9e0d253c2d020b1a01b1575f"
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
