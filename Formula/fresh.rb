class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.5.9"
  license "GPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.9/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "9f1ff6bc9e62c5857c92c72f05d551a7604d8131951244e32b1fb28fd90372de"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.9/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "aea215709bce0e1db25afe1040ff597e203e38a99a4d4302b9972e6a606a6f71"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.9/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b3ef8fd6629f194210d8864232c743a06e10c945635aaa5e830ae277825b34b8"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.9/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "ae0c6d1f68578f75e1ba27394e159c7c551084a8bd5fe60774d864df96911747"
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
