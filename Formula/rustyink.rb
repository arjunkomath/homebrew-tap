class Rustyink < Formula
  desc "Blazing fast static site generator"
  homepage "https://rustyink.techulus.xyz"
  version "0.5.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/arjunkomath/RustyInk/releases/download/v0.5.0/rustyink-aarch64-apple-darwin.tar.xz"
      sha256 "16c8c4416ab1627d8b37f47d6b7d5634766dc98eac532ce36f94aace87fcd69a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/arjunkomath/RustyInk/releases/download/v0.5.0/rustyink-x86_64-apple-darwin.tar.xz"
      sha256 "412ef68d3b929a0052998db7a6810e7bdfbe684e04c72a931c7abcc0d411b584"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/arjunkomath/RustyInk/releases/download/v0.5.0/rustyink-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "0653320fe6f50f5a9d453c09ed91ffe34c6d9fd8287e8afd2fe5d204e78a85bb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/arjunkomath/RustyInk/releases/download/v0.5.0/rustyink-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b3f3ff9b81b782f6a89320349bd68c1c060099418a1f259d2c843e24882de2a4"
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
