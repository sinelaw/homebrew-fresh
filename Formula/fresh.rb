class Fresh < Formula
  desc "A modern terminal-based text editor with plugin support"
  homepage "https://github.com/sinelaw/fresh"
  version "0.1.56"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.56/fresh-editor-x86_64-apple-darwin.tar.xz"
      sha256 "1bedc848bd140136b99a75d0a9104b5a129bd83b1605617570d3b12e18752697"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.56/fresh-editor-aarch64-apple-darwin.tar.xz"
      sha256 "9941141fce4e34e41447a892fcac7b1dde397e8b45efedb7a471b557fb7be415"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.56/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a4a9753423b539e6468b9c33b0b647b210db5a3ba7b98ed66d4926b4feaa3548"
    end
    on_arm do
      url "https://github.com/sinelaw/fresh/releases/download/v0.1.56/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "a712b1e92eb239d1f46052c6635364c4f43cc0d9540b0a2ff64d91423a8a1dd3"
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
