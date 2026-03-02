class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.2.12"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.12/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "899bf9becd31d439c8907f1b125effec2a3bb8a9e0bc2175b553fc10184ed390"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.12/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "f61bc2a6151d7f17eab9652c85f9f7df6c9fe31196809729f88f9eba2e541b2b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.12/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "7fe0a5bfd6fe37cc5db2d1ee79336a6b55749745429f5da8501d27562f8793cf"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.12/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "d8328d9092a1aa1eb45d96bfa74ae23b25b08e49826c33e9b34d71210a2eb20e"
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
