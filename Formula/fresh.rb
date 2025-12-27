class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.65"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.65/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "01168d8670323894a59d128cd8bd48262709b924223973e7c8d0135dbd4895a7"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.65/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "62ea0829fa503ff9eb087a20a09573bae39b149d2cdc057fbc6f69b63ba2e176"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.65/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "761f21315aa1206ecea0381b4ac53cc339e972b4b714660db7588279b6b99e3e"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.65/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "cfd4e890d8102af5702ea2da309c75a32224815250620427f64c6d2a6019d3f7"
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
