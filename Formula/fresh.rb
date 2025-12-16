class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.52"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.52/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "ceb9f5d9064b1831fa163de1f30a9dc9f30037c832b2e020346d2c6fd180fca5"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.52/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "0d62a633748657f36983ce284846895959ff014073af6c266cf3216a83087695"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.52/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e565c0ed95bed1c8c8bba2a1a3c440f41af7a6023dc5e84d78437b92f16a6ca9"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.52/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "dc68b00cc214afbf9e76db32d22e1c641cf95a762f421437f02399263087380a"
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
