class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.97"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.97/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "6b51650ad3dcd45ad97035b7660313cdae53d3d9e1bd1bd4692ef3f90dfd3464"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.97/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "8a057519fc9c95eae323087750db9dd943953be2fc7584e2cdf4c8112e9f2a04"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.97/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "44ab0637c46ccacb31a6876b143a930c08b741f1fe3cb1f7d8086eb65e64602e"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.97/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "1e4a949089862d9e24573f370ba3acfd321dd45878ba6ea4ef75f54e22ecf722"
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
