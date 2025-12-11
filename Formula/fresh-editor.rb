class FreshEditor < Formula
  desc "A lightweight, fast terminal-based text editor with LSP support and TypeScript plugins"
  homepage "https://sinelaw.github.io/fresh/"
  version "0.1.37"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.37/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "8006fa4d0997f7dd6dc7b1ef0d07cda47017773a8c2a38cd00d641830c9acb03"
    end
    if Hardware::CPU.intel?
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.37/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "7db02eaed6859a3f1a8b47ce028d59f68c722c58a013aecb39a0287c57978941"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.37/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "bac839bcbc11746a3775fae2a9927cef296f831be9f4624fa43de9e55b0d7f95"
    end
    if Hardware::CPU.intel?
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.37/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "9a8f63edfb6c186e3261e5fdfb11039b9509e8777faf2367735da92725dbf6c6"
    end
  end
  license "GPL-2.0"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "fresh" if OS.mac? && Hardware::CPU.arm?
    bin.install "fresh" if OS.mac? && Hardware::CPU.intel?
    bin.install "fresh" if OS.linux? && Hardware::CPU.arm?
    bin.install "fresh" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
