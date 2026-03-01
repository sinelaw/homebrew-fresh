class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.2.11"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.11/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "3c33642e654749e3fc21bea0410491877d430624f5d399973a7a266163a975f5"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.11/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "bff54e259e57a6d078e236ec8f2b4e6a07c96665dd20a347c8d93320ba021538"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.11/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "36c9a3a90a1ab10d9a2297c5cc66ea3e05508cdc7165bfa695a6b997a46c37d9"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.11/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "4d8a68165cb1424f3346d949390bfcf0e14cb57e84379595a327793d5e4b5fce"
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
