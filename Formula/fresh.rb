class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.2.5"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.5/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "6f0c93c6ea80072b317829bfcad99b9ea4bb6b2ff0bc3a87506982625b69633e"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.5/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "eeaab979c63f669373ec78aa1fa5028a73eebc552f32c8cb5676596be2f52542"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.5/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "838ab0d09e60fe423f38c78cab661a887975a0374cbaa782d59744f546a7dac4"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.2.5/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "4ce1034284608bec5ba6c465cf6560f108f7c4b2112eac4ea061e4c25c2cf1bc"
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
