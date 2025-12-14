class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.44"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.44/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "fd173f3430da1d2a6e7e667144513272eb5cd95b4f763a4f0c28d5d0220dd92b"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.44/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "5b745078c7f77b729b3d3d0a70e78b676a9283b9a27e59773a5f5e2f1a74e888"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.44/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e2f987f2350b6d5f07c6ec42ec0e0d3a49adff2a2d953b6154693866ab2fa5dc"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.44/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "6823416c6048bbccb158dea1b1274d8f2b78b04525bc9926b750dbf6f8acdc22"
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
