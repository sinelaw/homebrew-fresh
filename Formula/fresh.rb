class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.2.9"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.9/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "8f030dd5b8e6893d3e6284f2e1d216722ffc608cc76e95f9353cdd2097af8aa2"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.9/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "1b1bf378e176d1b472734901ea844caa8cf1b1dacb43a9825d9e2a25d28f0aee"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.9/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0ea60216c6ae04f67aacbd0fb451a952f3417b6c433f49f1024b73591a973d56"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.9/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "4c613e0f2bd9e316faf051a0a96e15df4d4364de7bf6d088ea5caca725199453"
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
