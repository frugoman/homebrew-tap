cask "meeting-flash" do
  version "1.0.0"
  sha256 "61a343aee99a0a9e5f05388e1af097f659390301ec101c3ce4d8ac0cca5bddd6"

  url "https://github.com/frugoman/meeting-flash/releases/download/v#{version}/MeetingFlash-#{version}.zip"
  name "MeetingFlash"
  desc "Menu bar app that flashes the screen red right before a calendar meeting starts"
  homepage "https://github.com/frugoman/meeting-flash"

  depends_on macos: ">= :sonoma"

  app "MeetingFlash.app"

  # The app is not notarized, so drop the quarantine flag to let Gatekeeper open it.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/MeetingFlash.app"]
  end

  uninstall quit: "com.frugoman.meetingflash"

  zap trash: "~/Library/Preferences/com.frugoman.meetingflash.plist"

  caveats <<~EOS
    Open MeetingFlash from /Applications and allow calendar access when asked.
  EOS
end
