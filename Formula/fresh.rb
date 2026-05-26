class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.3.9"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.9/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "b252f4e69ba97271ce97cda16fba6e6332459284fb20dbe32629897c1cb39273"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.9/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "f1a4354cc92cf1a2d59a227ec190d21ac6bb72fdec94dd15ef9eb0b24c04140e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.9/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "128cbc3a520e9978a7529c6a475e2cea4cc770cdfea9f401a0624b7620665e96"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.9/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "0b5d2915e17e21f7734ad6c87dd07b180123bac585feff404827ec60068be75b"
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
