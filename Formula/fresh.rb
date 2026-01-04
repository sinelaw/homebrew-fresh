class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.70"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.70/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "b022a63e047a2255d2a5a83e56703f983d29b84aa00b46841d8547e4a7f07f6c"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.70/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "1df213fa65a60ef654cc329ccf2c2df62ea1785601c1a2e947e60c166fecb6a3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.70/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "560591aa15f9c0c0d7c8811ef2995fe030f6f719c6ad3044c1ba145a36b5b603"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.70/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "3162da6e331e00e33add778ac262db4669747e9b2b129cc983ac2867c4d2e0f3"
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
