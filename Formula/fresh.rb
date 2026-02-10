class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.2.2"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.2/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "0c6ab4d6b567f88f76ec715a64cb39fe20501b9dcf2b63b13c822e1b39152582"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.2/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "3155e3e6143b2fe7b31aa2b0916e4edc459f34cc17b6f3b205d1654cf635dd48"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.2/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e8ecc6f880b1412f619f8b12e1745038f7022bed0eb2acd625952b7ab04d8f8e"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.2/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "f56857a725af094854bce5b43ea437a6ba87025e155730e976c07ad87db63007"
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
