# Homebrew Tap for Trace

This is the official Homebrew tap for [Trace](https://github.com/arjunkomath/trace), a system-wide search and app launcher for macOS.

## Installation

### Quick Install
```bash
brew install --cask arjunkomath/tap/trace
```

### Add Tap First (Optional)
```bash
brew tap arjunkomath/tap
brew install --cask trace
```

## About Trace

Trace is a macOS background application for system-wide search and app launching, similar to Spotlight or Raycast. It's built with SwiftUI and runs as a pure background app with no menu bar or dock presence - activated only via global hotkey (⌥Space by default).

### Features
- **Fast App Search**: High-performance app discovery and fuzzy search
- **Quick Links**: User-defined shortcuts for files, folders, and web URLs  
- **Background Operation**: Runs invisibly until activated via hotkey
- **Toast Notifications**: Non-intrusive feedback system
- **Customizable Hotkeys**: Configure activation and quick link shortcuts
- **Modern UI**: SwiftUI interface with translucent materials

### Requirements
- macOS 15.5 (Sequoia) or later

## Updating

Trace will auto-update via Sparkle when installed. To manually update via Homebrew:

```bash
brew update
brew upgrade --cask trace
```

## Uninstalling

```bash
brew uninstall --cask trace
```

This will remove the app and clean up associated files in:
- `~/Library/Application Support/com.techulus.trace`
- `~/Library/Caches/com.techulus.trace`
- `~/Library/Preferences/com.techulus.trace.plist`
- And other related files

## Issues

For app-related issues, please visit the [main repository](https://github.com/arjunkomath/trace/issues).

For tap-specific issues, please [create an issue](https://github.com/arjunkomath/homebrew-tap/issues) in this repository.

## License

This tap is maintained by [Arjun Komath](https://github.com/arjunkomath).