class FreshEditor < Formula
  desc "A lightweight, fast terminal-based text editor with LSP support and TypeScript plugins"
  homepage "https://sinelaw.github.io/fresh/"
  version "0.1.31"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.31/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "2618edfbe26b24b1e693bd47e1d1ea4c68769b16078aaf5994d052edf6966275"
    end
    if Hardware::CPU.intel?
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.31/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "c84cb07fc07024cfb7d9b654149b61147cfae045b27a12d5945e2196c3cb1bf5"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.31/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "55f18776c9d3d29222e8976ff3dbaefd1a45a697a8efe7a0228a3e2c879b1016"
    end
    if Hardware::CPU.intel?
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.31/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "27a1441074385753054cd085afe521d167ae52e5dfa5aa72fd22dec320e32112"
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
