class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.3.10"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.10/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "a3738aa709dedff4455cd8140c379657ef7b6ef46930465daec67577acd8569e"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.10/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "4e253011f02c5a0368cb3fd2e14a22166efc8948183b03eb709cd3c11856604c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.10/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "d508ab906ac7d7572132cc5e169602473b0bfad093b68bc0e10ffdd87b4c85de"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.10/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "1c1c68f6b8208d12245974bf1b6f131ad9983b3aa1583539c1794860c7c20199"
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
