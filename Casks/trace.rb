cask "trace" do
  version "1.14.0"
  sha256 "69d0ade955fc816fa26938cfe5367b97b50676744b757cb965967a3fee7eb2af"

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
