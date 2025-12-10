class FreshEditor < Formula
  desc "A lightweight, fast terminal-based text editor with LSP support and TypeScript plugins"
  homepage "https://sinelaw.github.io/fresh/"
  version "0.1.28"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.28/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "7a0bf049e8ff89ed0b23eb5fea7343128cd79996db7978076ac8b549bd316077"
    end
    if Hardware::CPU.intel?
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.28/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "a603273cc7911250ae12412d2068d5e5ba0e374163986eb5285bf591a5c191c0"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.28/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "0208673fc9d90e4be55d0f6701a8fb8a834dcc6772e96b6c15c8c0c83cf99831"
    end
    if Hardware::CPU.intel?
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.28/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "92396dc6919dc0fa5729fe3eeca9fcadad581fe6390867046f6431005370e5ef"
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
