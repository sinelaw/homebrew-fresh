class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.98"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.98/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "363843c4a5bf5a12c4b72b9be356e3fbda38ca82bf77a381bb0744b62f363f0f"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.98/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "986f51b58d2d374046ad5ba32146fd461d4e6aff4c20e6ea75457d59b59ae9d9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.98/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "eb34788a04e3db358716e77fb397e5bcc3d4a93bec04278c1c9a0911a621a4ac"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.98/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "ab117ff6900193d3b413041502e3853ac5f9c1fb3aabf377809549c91910a7a1"
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
