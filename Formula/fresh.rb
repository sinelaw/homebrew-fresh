class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.94"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.94/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "d8db23815c7cc7831074b7f649085cfe5c84da97cc2992b6b43665dda7fab516"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.94/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "fe78f316b9c56d102fe7c6e5508f45225df5c433d557f0e0ccc75fc2a9778a68"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.94/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0cd93770206788a2406f4ff83ffca71405f61a1abaf31af30ab795ce3dff0830"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.94/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "e313f833d1f4589b8bc9c0db5c9ec15981ad7944cf6b59df44207e60bc02030f"
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
