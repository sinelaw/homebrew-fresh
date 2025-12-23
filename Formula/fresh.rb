class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.59"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.59/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "ef74bb156017d2bc61e7e515484e1bb7f56ae282366cfb5aecb57966c9fa46ed"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.59/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "ae9ec943efab1a5273fc958aa76562d53525cf59bbb800c634b85665ac216d2d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.59/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f889fb6ddcbaaf828041b097cb438a3256a5187ac98dcd48a674783eca711255"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.59/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "5cc3e7978e6be44fbfd94bedc143e95b4323e78a9643262c992638fa5373fc03"
    end
  end

  def install
    bin.install "fresh"
    share.install "plugins" if File.directory?("plugins")
  end

  test do
    system "#{bin}/fresh", "--version"
  end
end
