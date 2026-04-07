class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.2.22"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.22/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "d3062edfd982cefa1dab9ef1c08e394c8cd8df980d80511821eba8e52d9e9b0a"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.22/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "d4a9e64cc6e3078cac056de9f14af5e6b00ba129faac4968bfe60c2e35bfb012"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.22/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "ec03908c6eb513df5bd29242d704190f395b6000f2df784e40a7274c3af917da"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.22/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "4359657c1919d3e1d62aafd11724794c387b8bb5321b1f3b12286e8ba2d02689"
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
