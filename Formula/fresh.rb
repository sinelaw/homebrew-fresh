class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.4.9"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.9/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "823261e1e49a53a6c13801caec8f61e10be9dbfac55cc1379fbe10d90419a0a0"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.9/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "b4939d6a1362135b36c4c97e61b68a6489379927326d50f2cf4042b35c8efe70"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.9/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5f4730a614e30fbbbf3e232cd28013929d90c3dfbe7ef59b1ce53a2aadb647af"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.9/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "fadd8ee9535278f702b66af3dbdedf1e0bae63e3f05d0a581fe185c7ea3dc628"
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
