class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.41"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.41/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "802f13df2718ad49604c8f42d2e9073d96c96471be9e564dd3323c09664026a7"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.41/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "0193aa0d3fa62e07e4cca76d7cf7b0aaf93b7fa2e459bc13e90403c869e65133"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.41/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f06b244452b9a2fc278b79e95ea592103e12add01511695d28f3c7af9fb75f93"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.41/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "5a912c8b18df951a482fc2c0dcd8dc2b7f666cc131f0f9b8edb9427afa0e83ab"
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
