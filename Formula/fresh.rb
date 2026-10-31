class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.5.7"
  license "GPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.7/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "775d231d36cb2c4f7c77d2edf1024aca7bb04321eac5ba54f0a75a47cc6498d0"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.7/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "766775670793f08615819b25ea373b21e3a34c6d1e1996c482720ac227142303"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.7/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4112b8b131e02bf4896a09146c4dd7b3383a2332ab554c3638394932ce94baff"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.7/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "ffb4f056417bc653ddd073921e123491dbe3509e83f3fd55436be372a35e8f84"
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
