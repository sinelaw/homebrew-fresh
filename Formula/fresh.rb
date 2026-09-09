class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.5.1"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.1/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "86b3aa2211e5c44cf2de6319ae270394f23f003ed7aa67130a07ba104ffe65af"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.1/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "e1a25623d22903c34bc6925248890706d3e37e92a71b32a3ac5611965eb82536"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.1/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "dd162ec4b367860d4235b4919be9dc3184211b663b5a81af34455c4b1d2c6ec2"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.5.1/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "237bdb8c774fc402dc0dc13428215d5c63d70fe0e673aa99bf9897ed7ce3aac1"
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
