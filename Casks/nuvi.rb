cask "nuvi" do
  version "0.3.0"
  sha256 "6db964d7a381ab8ee7d325d4caceeca9766f9df87357d18a7df7e11c07b3d797"

  url "https://github.com/arjunkomath/Nuvi/releases/download/v#{version}/Nuvi-#{version}-macos-arm64.zip"
  name "Nuvi"
  desc "Native, GPU-accelerated Neovim GUI"
  homepage "https://github.com/arjunkomath/Nuvi"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :big_sur
  depends_on formula: "neovim"

  app "Nuvi.app"
  binary "#{appdir}/Nuvi.app/Contents/MacOS/Nuvi", target: "nuvi"

  zap trash: "~/Library/Application Support/Nuvi"
end
