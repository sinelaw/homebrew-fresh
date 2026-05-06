class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.3.4"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.4/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "72bac8969920ac4a036723a2a0793d6f472c23bc8433ee7b536ec19b76932020"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.4/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "813c640b51da460fbf9f67dbce96d03717c22613db88492cf6925ca0514841e7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.4/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "86f1b6d60eab3d6d750907d6e908fe008bc9a4da021d20c1bd317f8b0195aaa2"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.3.4/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "f2759d4d9dbafd98471165dab296e273f6d2fa750fee019b272d25c6a6f1ecf6"
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
