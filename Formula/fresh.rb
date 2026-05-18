class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.3.7"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.7/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "82624351b1ed6de71110c201dbd288ba8a5ef7d6da35cb7faf93ce2f967279ba"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.7/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "97f8193f46ede62e7dec08feec8301837bf12f9a0ec3fee678eebb652ad8d0bc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.7/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "150922ca57f19cb20407d02d3fcd86e1ffdc92cdce7dd856bdafbd906efc0d4b"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.7/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "1e1b1327eff902a21ec5d3d11e0b240896af8ab7b7d5f0dfd5b7cfd3ec47f97a"
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
