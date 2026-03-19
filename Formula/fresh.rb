class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.2.17"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.17/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "67351384a3724ea7140bc9a29407bd84f29e54466c075db9a65d7d876bd2a7c3"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.17/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "11b659256cf0217af172caa77cdff4e5d63b53c9835018df1714ebb2714d8bea"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.17/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "62d6466a9fea40f36a71e0738fb023d523bf71099ec99d9a6c9d4d9d5ee8cabb"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.17/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "8313ef8389778df1bc4f097d3580f6e229ebd652ffc35cde9a9eaf4283327ebb"
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
