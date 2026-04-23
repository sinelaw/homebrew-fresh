class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.0/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "135ee21a05d4450588741af49ce210b9c488155644bd7c2db785414640d9bb23"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.0/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "3fcf8238caafb16dde300801bd7037fc2c366a7f124c730a93c4ddb405f550f7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.0/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f0c97e5b5160f195a5d879c3581f2cca0a28ea1127d16dd04589277c114e9173"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.0/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "606988c01b1e6cc3c8c1aa6966e5f1874b1e6fd68d3f6bf1333bdfc414628dd3"
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
