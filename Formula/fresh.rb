class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.71"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.71/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "fc37201e244a10dfbca21d43f31e14443946f2cbc2a6b0bd6411e77eebd5c339"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.71/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "055da6c6c22cada1d327e8b1749081ac88e8af644ecfaf9b4984e34272dbfedb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.71/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e778a54219ae732f4950a3b82f81c191593541e53ac132eff9f1df95b6ad49a2"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.71/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "176954124c6bae833342782b172b39e2e97a8e67af1c42ae3b32a5be9dc5105a"
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
