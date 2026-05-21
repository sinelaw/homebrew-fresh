class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.3.8"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.8/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "1c66e50575400415e8068f5f7eb41519e54745c019f822340cbfb94e3e9bd007"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.8/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "c0e54284c86d09fa54d0da497dc341c39db4af64075ac72f876dd8bcc9367d1c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.8/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c8f9cb89718693d3b31979d777e57b4e68e78627fb0a6a1ecf2e10860745bd40"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.8/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "db7776e60e0895871dd5d478c6767e76e06ffd4d49277068e6788010e850b5e0"
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
