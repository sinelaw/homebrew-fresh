class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.4.2"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.2/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "ee7b64e7c3bfe7be23dfc677e855387b1e3953811dd750e8b3a3c0d5d90bc7f6"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.2/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "cbd11873000b8391ecc6a1dccebae42a799f79e4f07c8ce5d56c2273cec90352"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.2/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "9d6e3467b8eaf9e34a883f87946e1dedd340b614f39fdb9e4f4b914a03749e74"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.2/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "6eaf7ef784759fa26ad02740d53b3dec64c59450f68fa8e54bff073359121319"
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
