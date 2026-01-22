class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.88"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.88/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "8d4d2bc1adc763e0d35aed8c18af9e7b0039ac8199461376705e16180a2e9a9e"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.88/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "3bfe988b222044588a930f523495fd7dc455e01fa6c386a9c82c22551db6409c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.88/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "031aa56c3b5ca0ffeaffe118ec3f629b01a68d5a42d159bcebe03e891b8b03c1"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.88/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "173524506b4af562c40ec4d1ab076096dcd28032ee2692ea272822dfa82986a5"
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
