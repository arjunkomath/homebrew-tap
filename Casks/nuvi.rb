cask "nuvi" do
  version "0.2.0"
  sha256 "67b374a046ad64b6d1dbff4cb6d116d079ea8e5dd7544230e4e05954374a9dc6"

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
