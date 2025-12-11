class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.40"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.40/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "923d84efda7df0765f3b9ac2cf61f2762abab95573fd3ac3cd3b69a45d2a0fb9"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.40/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "e7e0888fa8c5d53321712204b732d856d69b25354e4bc651d8489c30e7d4c876"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.40/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "26bd9091e85e4db164622cfb16f015c9a498a02d7283f6dc99660b70c668ab2b"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.40/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "3636006fb4bf377cd7991a246280bff9fd8e78dbf93f09d1c75a270c92f47eef"
    end
  end

  def install
    bin.install "fresh"
    share.install "plugins" if File.directory?("plugins")
  end

  test do
    system "#{bin}/fresh", "--version"
  end
end
