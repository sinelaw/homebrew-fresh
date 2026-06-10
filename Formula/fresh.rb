class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.0/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "6d9268a2df743f79b997bea58b30ac87ece7221d41ca1ae12cd624dd138c1d81"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.0/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "144298f57386712c46a3fd75131a4fae537e927fcf41d7505d719b474f8e6eb4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.0/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "1e67e1b7ffe47feec5f399d3b8e4b4681d8a5052d0ec1784663a149a56f0ac0e"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.0/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "edfbcb4d24074769cc918ebeb8498a4bd2bd9854a4011302dae76cbb041b6fd9"
    end
  end

  def install
    # Plugins and themes are compiled into the binary; the tarball
    # ships only the binary + docs.
    bin.install "fresh"
  end

  test do
    system "#{bin}/fresh", "--version"
  end
end
