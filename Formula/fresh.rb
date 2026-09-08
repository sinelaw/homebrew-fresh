class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.0/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "1ac76e71659d37b220dde12840831e9d961a4c32d7634025809a42951766a662"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.0/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "dd254274a085e3ac1fee0f9e67b9d0e3fc19fbc160fa051cc5f69b893fb987f5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.0/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c82d15f2c6a8f8d9d7223a9747e3461ab1a6b99db307e77fc278f399c7fa0354"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.0/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "0336f899123a20b4efa896a84b3e365c8a9727fa4a131daf9692a4ea563cce42"
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
