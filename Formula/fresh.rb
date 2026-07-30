class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.4.6"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.6/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "4b3ea5178091bfbf78f3d74873e6113063d72fce26aca3e9e856bf5c9dc89db4"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.6/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "040070d98684d3d30511b3df6168b6b43d2325ebc07bfe5e6079dc6c5d4fa25b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.6/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0ccc39bfbbc4f3b29e234567f3bb9d99712ed36d5a752a31199051d30fc56615"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.6/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "53a50021787fedf9546cedfd91f28fa8d41519f596e10f1a0e5e449e173fb194"
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
