class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.2.14"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.14/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "f0eac80f964d78088d3027622e2267bd32f26cf160ff3ae786d9c02950df12e6"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.14/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "960c71dfb05a6c0c39377de4ee7bcfab28e10b8121695a24ba6d148efe759694"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.14/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "70016a0a9fdb6b9b22a1ec6f9de19e5115550abf68ba3063008d04274a3f1264"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.14/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "3b30a4960acc89863af55c9f0fe7d3ea18972b7cf157180a61eddf555f61322f"
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
