class FreshEditor < Formula
  desc "A lightweight, fast terminal-based text editor with LSP support and TypeScript plugins"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.20"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.20/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "b7e43c352561de441c51937455f0d5e26aa1e42ed6b617cb4501defc6220d384"
    end
    if Hardware::CPU.intel?
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.20/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "3713832ca005d25d5ad62a15b6eea3d81c027b5a266025de8196d001dd8e24c8"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.20/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "c2e4a0347683cf9275caffc25e7887bfb6cf6890514934190b1ec573d1a4de14"
    end
    if Hardware::CPU.intel?
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.20/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "22b1e49df93373c9b7237c8b75be09512268f1bf16dbe0dcc762048f8f4c14de"
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
