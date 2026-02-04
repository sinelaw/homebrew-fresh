class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.99"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.99/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "d0163be680b235197a7a4db3e2251c63b6873a43367710d4ab0fc2c6f55160de"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.99/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "af85b82a250bb28101c12351a99eccaf18bdfbdd91621447b9ab39e84cedb21d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.99/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "7907ebebaf1dd05f8fd725a59f8855aec2df25a2aa82f3c8570fcbba2744d6de"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.99/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "9f22b4265742fdb1a0d99b2fe2d2e76f09ae463d576377fb945ea2d02104a6fa"
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
