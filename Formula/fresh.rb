class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.2.21"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.21/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "53ee16d5031727f1ceb08683ef4cfe1a3bb140c537c80cd9270b783645e7a101"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.21/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "75168daccd46263408a7ebb07e1452c8084a225472ecdeca845a1d0c5862cd11"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.21/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0b15d9f44526b50650db021af0541be98f7b4791305f5609ce4b58b71cc3d0da"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.21/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "8beedea03a99d7a39cce7a9e20def3368a1e848444d9e5f8e147e256b90f962e"
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
