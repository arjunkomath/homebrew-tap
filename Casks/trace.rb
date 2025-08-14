cask "trace" do
  version "1.2.3"
  sha256 "f45ebdae130ec01f5cf1287d5ffd006c5aa1258718bab6279b61c4c970beb374"

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
    "~/Library/Application Support/com.techulus.trace",
    "~/Library/Caches/com.techulus.trace",
    "~/Library/HTTPStorages/com.techulus.trace",
    "~/Library/Preferences/com.techulus.trace.plist",
    "~/Library/Saved Application State/com.techulus.trace.savedState",
  ]
end
