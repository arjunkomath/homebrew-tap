cask "trace" do
  version "1.3.0"
  sha256 "47d75f0c56cb41a655dd8a984950be4bc13b57a1a037b3856d35a82e28a4ad8a"

  url "https://github.com/arjunkomath/trace/releases/download/v#{version}/Trace-#{version}.dmg",
      verified: "github.com/arjunkomath/trace/"
  name "Trace"
  desc "Spotlight alternative and shortcut toolkit for macOS"
  homepage "https://github.com/arjunkomath/trace"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sequoia"

  app "Trace.app"

  zap trash: [
    "~/Library/Application Support/Trace",
    "~/Library/Caches/com.techulus.trace",
    "~/Library/HTTPStorages/com.techulus.trace",
    "~/Library/Preferences/com.techulus.trace.plist"
  ]
end
