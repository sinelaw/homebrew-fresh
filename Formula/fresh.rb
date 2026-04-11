class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.2.23"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.23/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "06eba9dd5dd3e620c928d3b9b9d3634e28dbcf3613bcb206109179df8e316396"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.23/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "6fbd8c05e32fb36442639ae582c6e4039974ac99814fe5ad3fe99534bd2ca55f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.23/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "50670e9210a4469b5ae4021202727f8d6a077edef58a89220fe6c8785c5d4392"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.23/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "353856e664e8cdb321bb0bfcec44b0cacf7491d1394fa7fd7da08ad8a66f24b4"
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
