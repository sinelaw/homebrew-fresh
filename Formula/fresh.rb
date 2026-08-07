class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.4.7"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.7/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "9322faf15aece0e0752c519e1a7a9f0d7a107adfbd38001707e3357ce6167d59"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.7/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "9ffa44e70e73ee1efcafe604936aa5aed5301cbd548e50b2448199c2fbf1b8f5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.7/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c2d161b2686d1e5c3c09db2591746402993d33f33ff77bf4fe67b575472ea87d"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.7/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "81c7b6f3ad44f5e6af895495da06257d1580668d6eabee6a1e13853b49dbe4cd"
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
