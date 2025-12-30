class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.67"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.67/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "8e2efafe65a92a6b00fa7c6cbbbd71c353bd561c3d2edc96165a8c1c396b17ff"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.67/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "9864bb635260ca9af800b23f4f4ecfd8f846dac0e65de00126405edc1a55e710"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.67/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "9fbef0bc84a018f6634ae856168ba6b4ec7e881400babf033641b0d5f0f1c92a"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.67/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "2599bb49f1fbae56caa826bee70fed0493443fd8d4bef5219fb2b9267b498094"
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
