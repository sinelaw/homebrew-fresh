class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.5.3"
  license "GPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.3/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "6286d399e48e19c03849e5f606631909526aab889b9d012bd9af57a57dc6466a"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.3/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "9a720e3c24d889a025a151cffdb90b3f753b06810da67cac89e488cdc37ddab4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.3/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "8c7ab2006922d1aec31664dce014e8715a18c7c98df572a4d72fe8aaa16c8533"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.3/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "9f5538bb6da4d67609c82d7fbc7e2f76dcab385c920856713eee73366351f3a9"
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
