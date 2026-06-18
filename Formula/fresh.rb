class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.4.1"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.1/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "87071df277b87c75549f1b7b358bf9539246a037e07400df7ff50668e6e6556b"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.1/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "d1a8a8f82cf30b9bec6208fad00e9e5ac94a3f86aeb4279f5b80baa53cb5ddab"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.1/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0a8d1c75481aa426e5009c8a01f3368921b8c51425db858c7075270602e7fee5"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.1/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "8718761e643691143945d0539c720bc33e7397cccd3a59a1128ea13b479cc4b0"
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
