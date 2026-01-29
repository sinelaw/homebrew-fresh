class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.96"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.96/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "0f924b72c7784f07f9a3fd7d090d40a50ead433a75810d75c6a1a3e248ad5469"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.96/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "c65408c7371dc65b3b6c500679a79bfc4f2d06d88dc8f28e851a6e9fc46e1306"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.96/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b298f1e310a231ecb728e0382f37f2981339b407d85f00b58706537bbd94755d"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.96/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "83868f861dbf93ffa2112ffe21536f26615a1453cb9bb7232f8ddf93a7a6dac6"
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
