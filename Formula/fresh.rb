class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.5.2"
  license "GPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.2/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "63fdaa2dd2272a91f279138d029e488c1d6598adc51c7ea86d0830781a47d002"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.2/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "6bd40aece1cff6726f99f78967b490a0f09bf5a2f424b7c92945d96ee1ed56a2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.2/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "d7c6600cdd5c813bcd118d84fbcc0559fe9396756a46fd0b7b0c1bf6c5cf8fd6"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.2/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "12f15eff367c4a86b47afb939982e23e8bc92b8c62e7de3bdaf29d46d2872ba4"
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
