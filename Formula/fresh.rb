class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.2.4"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.4/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "4e29959b29530ed3b583a88e24d011dabc55ade2e3750c64a944d40481f41a0a"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.4/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "e090e09d307863dbbfa5a317b05a199ea4369280f5a6b10f8b030e4446d0f1eb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.4/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "bae4c0dcf3b2bca05abac30df229af8037798aa8169f60d17771c9676cd97df0"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.4/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "bd55436cf814564cca0345f9a0026b6a8090692990f3eb2aaa9399dc919e98d4"
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
