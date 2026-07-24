class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.4.5"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.5/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "941984507ee0f7c9bd0d6b03262788018444004093924979d7b22a52d27d262c"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.5/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "35eb07db24a7fcfeb3ccdae8513c920f6805047c2cb79fd564db6f4c5e865f19"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.5/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "71ca18f5a29040a2de5e3a23a854fa14be0eb8f70eb3d25bac1cc95703332b29"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.5/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "46c8a5e3a844a39407c1f657cc2b705bcc6853eb69ec5dd7dee8338d40b2bb24"
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
      formula = "fresh-editor"
      tap = "sinelaw/homebrew-fresh"
    RECEIPT
  end

  test do
    system "#{bin}/fresh", "--version"
  end
end
