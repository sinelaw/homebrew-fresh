class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.90"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.90/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "fa456a5bc769724999431d3d0ce065709796bd79785adae7908c6ba5bc03dda7"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.90/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "b1510f561d4ba0fb6cf0f57e5055cd93c92bf04bb2cc614dd4b62ff636a57a17"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.90/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0dd3f8c5e6d517c85a31cf068d955b59c75f214a7b2bef8fc7411bc53261723b"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.90/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "53adbded92079a099f921df26f4b772404754d42aab8a503ce0450366fa4e2e2"
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
