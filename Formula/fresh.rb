class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.5.8"
  license "GPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.8/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "bc5434b3a22e3bbb0295e77d3376bf8ca8a326851aa891b8ba4293cc05e22483"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.8/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "abb40b96149649f70bcc6ef10fb38ed022cb6b1658bac6122961e91465c80858"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.8/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "182787fe491b52a9a145ce25c934c654233b498665f100de44275a1ce98d45da"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.8/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "abd13f30a474ad5466f5dfd16e5494fb52be968185b00c7deb0f9e211d43bb00"
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
