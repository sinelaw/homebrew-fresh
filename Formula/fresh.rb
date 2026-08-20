class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.4.10"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.10/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "b767bc56c4652ffd40202d38b28ae536309eb5f86ecf16794667809a571ab806"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.10/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "cbcebcbcc1caff5c8ef8f545966ad521af19f9069ee7141f2b8561a3ac9ef53a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.10/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4234d3d35b03f406dd853fa88058aa60aaa5555e27af5e33607076e60d763cf3"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.4.10/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "0b51c2b30df8d40c5d2a7730a6e7d8b273cedb379a79cd344ab5fa3dd7d6b256"
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
