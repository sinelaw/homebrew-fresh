class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.38"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.38/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "267ba0a4fa845d97a9e1dfa885145590e64b9e6e580b1f73f01d77949c812eb7"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.38/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "41054495d5a44e26b09b12c6d82b6857585f07581db49eefd9d6d5b5f7a6dd41"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.38/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "1070a5009051e8cd68b7270a9ab66cc1619ab586df7ef9d9ac5358bd2f5d70c6"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.38/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "b83938eec48e0a34ea1e0492f7118804e0008c0f10e0a1b479f240a2f6daa0ed"
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
