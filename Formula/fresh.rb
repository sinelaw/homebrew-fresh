class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.4.4"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.4/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "b6f1f0f1cabd672714215b56c957ca2dae152b3968835b5f568980eb84d66438"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.4/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "6f233c64375bc0643ad22ae13df96d069fa134ae6d0886602d90a7b2a2c252a7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.4/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "3a0b96d349da2faef39d4d19237e1d1be611c4cd3c58fd8c3cfd209cad11d039"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.4/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "4085525afec7d21b82a3876eae0349e522fe89083351148958df98878c41bb09"
    end
  end

  def install
    # Plugins and themes are compiled into the binary; the tarball
    # ships only the binary + docs.
    bin.install "fresh"
  end

  test do
    system "#{bin}/fresh", "--version"
  end
end
