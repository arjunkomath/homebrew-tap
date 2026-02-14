class Arx < Formula
  desc "Protect AI agents from prompt injection and common vulnerabilities"
  homepage "https://arjunkomath.github.io/arx/"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/arjunkomath/arx/releases/download/v0.1.0/arx-aarch64-apple-darwin.tar.xz"
      sha256 "229f724a9b318e812421662714872113244108d43c5eacc930d3ecbe12e0db36"
    end
    if Hardware::CPU.intel?
      url "https://github.com/arjunkomath/arx/releases/download/v0.1.0/arx-x86_64-apple-darwin.tar.xz"
      sha256 "1bafe97c55871de49a1a1f15fd1e5d4c6f44a7d6189a7676ebdaf07d929b8cec"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/arjunkomath/arx/releases/download/v0.1.0/arx-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "d572eb09708a41bb99b6e2d9457abfca5abbcf08b98f9834f59f1412e6f04299"
    end
    if Hardware::CPU.intel?
      url "https://github.com/arjunkomath/arx/releases/download/v0.1.0/arx-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "55a8e1d0e7f36ebd14d1ad9278e4b1615a1a9a4753b963ae20de43f5ef1c6f03"
    end
  end
  license "AGPL-3.0"

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
    bin.install "arx" if OS.mac? && Hardware::CPU.arm?
    bin.install "arx" if OS.mac? && Hardware::CPU.intel?
    bin.install "arx" if OS.linux? && Hardware::CPU.arm?
    bin.install "arx" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
