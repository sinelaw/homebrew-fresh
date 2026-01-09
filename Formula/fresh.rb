class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.75"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.75/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "766c8da8bd54ca27ed328ae42cff74ccc1b7abac7d8535a68804ce5fe4b69e90"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.75/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "cd68ad4d00395a23556e1121ecbdfc24fe877274fce242e85ed03eb82f75e87a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.75/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "1ef63a98e36c46548f90b412571bdf07aa420900f630236f45a2fb84722f9db1"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.75/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "8df7a4c1aee82046181fb2bba6b9456a4108fff78bbfb14e887fb652384b7461"
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
