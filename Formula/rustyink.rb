class Rustyink < Formula
  desc "Blazing fast static site generator"
  homepage "https://rustyink.techulus.xyz"
  version "0.3.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/arjunkomath/RustyInk/releases/download/v0.3.1/rustyink-aarch64-apple-darwin.tar.xz"
      sha256 "ed7cc1df465e40b28383e811a1f74d964a4b66c4800a882c4267b39425e91bb6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/arjunkomath/RustyInk/releases/download/v0.3.1/rustyink-x86_64-apple-darwin.tar.xz"
      sha256 "6318b4425216e541619ca6af6ac7cf249732b3cae327be38f883c9526f9985f5"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/arjunkomath/RustyInk/releases/download/v0.3.1/rustyink-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "f2a1d4bf9af42c22886d646623b06ca99029414b9921147ef19476f7325ca76a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/arjunkomath/RustyInk/releases/download/v0.3.1/rustyink-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "7e7e4052eca09691cf6e009b8e0cf1a7d5d9f7f3e9116903d89d82f76ad205ef"
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
