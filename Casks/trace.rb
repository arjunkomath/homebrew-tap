cask "trace" do
  version "1.3.2"
  sha256 "99ee51815144406b079741439072321eb2071e1a449f06e033a0dfea2a75f895"

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
