class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.55"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.55/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "62a66ac9819d1dececb3e032c28751bf91aa7242ca3ed08ef064c8c61d3275e1"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.55/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "0d497bebe9a9ecaa68e9f62632c1ffe81d8ba12f15fdc0472b8611226eb61bc0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.55/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a669d949abdbb6fcd3060575e1b0afef6413941fe01596e7f295cd443a33f374"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.55/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "6cacd77e5d19e95678029c4762d19e59257380881ad57079d57d46f943124c1b"
    end
  end

  def install
    bin.install "fresh"
    share.install "plugins" if File.directory?("plugins")
  end

  test do
    system "#{bin}/fresh", "--version"
  end
end
