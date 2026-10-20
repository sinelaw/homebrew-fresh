class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.5.4"
  license "GPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.4/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "a75833fed2288c9e6bf7657221ce5026e44cbc3b141b1b27a36e9c16084e8bac"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.4/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "c722ce9ae6f92f9c4f5ba112f187296ba5bbb53d53e0c82478249becc9859cc4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.4/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e3599c93b1eece4700d7c30726b461c9b962a91bee5da31cdf44e3dffeb6206c"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.4/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "df10f648d81e194f613b975d63d4cdea3ccf3f6177325793701a50ce795ab143"
    end
  end

  def install
    # Plugins and themes are compiled into the binary; the tarball
    # ships only the binary + docs.
    bin.install "fresh"
    # Provenance receipt so the editor knows Homebrew installed it and
    # defers updates to `brew upgrade`. Overrides the generic tarball
    # receipt that ships inside the archive.
    (prefix/"share/fresh").mkpath
    (prefix/"share/fresh/install-receipt.toml").write <<~RECEIPT
      schema = 1
      channel = "homebrew"
      version = "#{version}"
      package_name = "fresh-editor"
      managed = true
      self_update = false

      [hints]
      formula = "fresh"
      tap = "sinelaw/homebrew-fresh"
    RECEIPT
  end

  test do
    system "#{bin}/fresh", "--version"
  end
end
