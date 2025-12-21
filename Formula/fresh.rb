class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.58"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.58/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "4d4fa3a290ace2d48d9e38fa5726d4258c5809b9f25b1c0afce00b068510c088"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.58/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "def4369320377326f47ece3c09aa5ba122418d20f6e34107d3f0975fd180e6fa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.58/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "1a03c85770d5f1bd72b972fa3d59b54d69072b3a4bc265a4e2825a12622be0f1"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.58/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "9df8cbc9fe4d0b53191b954cacb5aa7e44142dde68c709d5f2a38f159961682c"
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
