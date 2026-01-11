class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.76"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.76/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "9f9b831f7baa140ecb73aae23b8243c85871a14eb739cabc9136c7fea2dafbc2"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.76/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "1c59d7635595933b995d19155ce1ba8928093dfe44c692e147439832bbe3764d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.76/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "6cd5ad186c38b89a2dc4cce3c3cba48469626736ea8672d7e84162622246491f"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.76/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "8e4c918ed2724535c1ac868d69155d31eced8c6be1c69c77486b6e51ebdc3dfb"
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
