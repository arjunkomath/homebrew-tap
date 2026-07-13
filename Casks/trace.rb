cask "trace" do
  version "1.15.0"
  sha256 "3a596e8a37eddd73ebfe5d1a193583a4007996b6a42d9338f8bf8f63f2825626"

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
