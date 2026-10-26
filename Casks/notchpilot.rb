# Copy to Casks/<appname>.rb in a repo named Husainj/homebrew-tap.
# Users install with:  brew install --cask husainj/tap/<appname>
# After each release, update `version` and `sha256` (scripts/release.sh prints both).
cask "notchpilot" do
  version "0.2.0"
  sha256 "bc3a7191102601410002ec8d44e4288f0f06139d30150b763a7b8940dad70fa7"

  url "https://github.com/Husainj/notchpilot/releases/download/v#{version}/NotchPilot-#{version}.dmg"
  name "NotchPilot"
  desc "Dynamic Island for the Mac notch, with an AI coding agent dashboard"
  homepage "https://github.com/Husainj/notchpilot"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "NotchPilot.app"

  zap trash: [
    "~/Library/Application Support/Notch",
    "~/Library/Preferences/com.notchpilot.app.plist",
    "~/.notch",
  ]

  caveats <<~EOS
    The app isn't notarized yet. On first launch, open System Settings → Privacy & Security
    and click "Open Anyway". Updates install automatically after that.
  EOS
end
