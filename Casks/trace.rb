cask "trace" do
  version "1.16.0"
  sha256 "41840c9b84eff21665f100f0a461240fa397c4dca703b16debe7b75fabba47dc"

  url "https://github.com/arjunkomath/trace/releases/download/v#{version}/Trace-#{version}.dmg"
  name "Trace"
  desc "Spotlight alternative and shortcut toolkit for macOS"
  homepage "https://github.com/arjunkomath/trace"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "Trace.app"

  zap trash: [
    "~/Library/Application Support/Trace",
    "~/Library/Caches/com.techulus.trace",
    "~/Library/HTTPStorages/com.techulus.trace",
    "~/Library/Preferences/com.techulus.trace.plist"
  ]
end
