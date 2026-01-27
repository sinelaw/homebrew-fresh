class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.93"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.93/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "72eeba5bf5f5d07003f1e4c153176f881ffa77f3907a8a866a390862d2c6be42"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.93/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "94e83717d3e30b21bf036e5b965fa0150b9399a25e3caf94ca171c8337e148e7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.93/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4e174eddae2382b50d12c61ea73be5c6483ce46652573f7a4a0f566341d197c3"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.93/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "b43f0486c392056458f93bd53956008240acf63e8fecbbc20effafea85569ea8"
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
