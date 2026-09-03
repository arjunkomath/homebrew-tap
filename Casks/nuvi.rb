cask "nuvi" do
  version "0.4.0"
  sha256 "93656cf254f59c436e79130fd73f4c3fbf4ae06f9aba45c558bc601470fe1630"

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
