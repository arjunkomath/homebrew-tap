cask "nuvi" do
  version "0.1.0"
  sha256 "0dd49c81993226cacce52fc2249de676f5799fdbcd8ccc794dabfcd1410bba1f"

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

  zap trash: "~/Library/Application Support/Nuvi"
end
