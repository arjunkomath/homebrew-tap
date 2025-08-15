cask "trace" do
  version "1.2.6"
  sha256 "7592c78ab59a4d1b5c6887c53329b14e7452c2714ec8854178cfcf0e7d5a3741"

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
