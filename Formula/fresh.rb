class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.2.25"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.25/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "484c000d8666748f6f8dc0678a5fd51eccde1a5bb36a255b57da7f5ac19951da"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.25/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "e61f73ad526d64e66158d24abc368516a723b2e2528c4469e58363a93905999d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.25/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "cff99cd4f5654c89279c33eed40e8a98fdf4f629cedb22db7c92efef5bd411e4"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.25/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "b048b3e3f74b75e8e9d542305e0d26199c99a6726df5e54a740a766f4213bd67"
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
