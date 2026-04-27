class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.3.1"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.1/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "3a28fcfc818721342cf0ea7780b4489a9d601fa422912dfd355a25276557f015"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.1/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "f4c00e54da152545772203c2ef00ed0e764b40b07869d814cf4895044293c43b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.1/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "944430f82576e1f1f893c2816a5ff6c625334420a538f4212e8898e4b0d24a72"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.1/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "deff7d77c4b1bc893645b504f82cf2c2e230c30f7c5381d5b1f6e2438d0bde00"
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
