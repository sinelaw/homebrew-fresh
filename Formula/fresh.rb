class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.2.16"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.16/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "edf711a9d0153a689ff32e8ce096c992ca61e67d9988dbc521c5666cd2b5384b"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.16/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "cef2c79aa58e59828bb09184a7d1040db3f9caf3501bd1f9e8dadd95fe613433"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.16/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "3039c3f697c8b70d81bcd788032e3194b451189b204c2b4224b9d8256a836abe"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.16/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "53fc436a3cc6c34f4c662b2ed9f48f1cb441f59cf0bd628b2c8d2c0eacfa4ca5"
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
