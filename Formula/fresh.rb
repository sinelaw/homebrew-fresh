class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.39"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.39/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "349ac1e86b685ab7907657ba6a42b407a0ee283a497aff57cd110db540052bb7"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.39/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "716ea2bad8cd57566e631ca733beccdc7bbfb0bcbcfda7e2a061f0a1c78ae0ee"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.39/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "80443c8d0d72da6316e184f7f044854543c6d586a6ec18f4f0a3f82fa8d02ca0"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.39/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "bcaa74165478272b032ae774744a899c59a40d752ed44295c7610c6dddc27894"
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
