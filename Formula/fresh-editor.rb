class FreshEditor < Formula
  desc "A lightweight, fast terminal-based text editor with LSP support and TypeScript plugins"
  homepage "https://sinelaw.github.io/fresh/"
  version "0.1.27"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.27/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "7ec115d5d295b32a9b8d2ece6f98eace70f5b613a3912c3c813054d0a514579c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.27/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "a65b2b9401f55b82bcce6636644ca561be0410f3df53e4f91732f9d6eaac2e3c"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.27/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "6edfbf15585af14bafb86f58c7a96359016852abf8965599ee87c5824444c3fe"
    end
    if Hardware::CPU.intel?
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.27/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "34ae360d72f81f1ec9174b5b2dff3d61d0cc532cb4cf62e593f7d2a1e94b62db"
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
