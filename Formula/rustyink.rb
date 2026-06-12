class Rustyink < Formula
  desc "Blazing fast static site generator"
  homepage "https://rustyink.techulus.xyz"
  version "0.4.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/arjunkomath/RustyInk/releases/download/v0.4.0/rustyink-aarch64-apple-darwin.tar.xz"
      sha256 "7f14696ab32ed930b373e246d8018393ea77403cdd6ee06ae3c3816b967758d6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/arjunkomath/RustyInk/releases/download/v0.4.0/rustyink-x86_64-apple-darwin.tar.xz"
      sha256 "8138d2a38fa6e8cee09a8de875d865ba0ada4ee8e37055976c29c4248a5dde7e"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/arjunkomath/RustyInk/releases/download/v0.4.0/rustyink-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "789207ea799d99b21cb615ea3c66ffcfce1d5db19c6fc51dd07cfc9187f8c39e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/arjunkomath/RustyInk/releases/download/v0.4.0/rustyink-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "cd4b2a582b067cb9998c3e092b2282d49bb1cc13e04e6eb9c724f913152aecd4"
    end
  end
  license any_of: ["MIT", "Apache-2.0"]

  BINARY_ALIASES = {
    "aarch64-apple-darwin":              {},
    "aarch64-unknown-linux-gnu":         {},
    "x86_64-apple-darwin":               {},
    "x86_64-unknown-linux-gnu":          {},
    "x86_64-unknown-linux-musl-dynamic": {},
    "x86_64-unknown-linux-musl-static":  {},
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
    bin.install "rustyink" if OS.mac? && Hardware::CPU.arm?
    bin.install "rustyink" if OS.mac? && Hardware::CPU.intel?
    bin.install "rustyink" if OS.linux? && Hardware::CPU.arm?
    bin.install "rustyink" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
