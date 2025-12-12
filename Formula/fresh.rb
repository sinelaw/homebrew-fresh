class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.43"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.43/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "50fe88f799e9385b07f016935080435558c54e12abf75730f1c17a93dcd25360"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.43/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "f141e5a265db1dcda5ef79d00f2cafc66ab06b73141c0452d77f63bcb5398c58"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.43/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c647b26c3564f976ca0ba50c598e9e9021f6a19a58766daec6a3c1890b0ddc52"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.43/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "a5d674bfa5455f48ca82b33eba02085b452eaeff6eccf84f476e033e7d84e4e0"
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
