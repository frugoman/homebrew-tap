cask "meeting-flash" do
  version "1.1.0"
  sha256 "f9886233ed7441c6e0a99228e9716696143aa489efae8d276ce60d1c33c3cca3"

  url "https://github.com/frugoman/homebrew-tap/releases/download/meeting-flash-v#{version}/MeetingFlash-#{version}.zip"
  name "MeetingFlash"
  desc "Menu bar app that flashes the screen red right before a calendar meeting starts"
  homepage "https://github.com/frugoman/homebrew-tap"

  depends_on macos: :sonoma

  app "MeetingFlash.app"

  # The app is not notarized, so drop the quarantine flag to let Gatekeeper open it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/MeetingFlash.app"],
                          writable_paths: ["MeetingFlash.app"], writable_base: :appdir
  end

  uninstall quit: "com.frugoman.meetingflash"

  zap trash: "~/Library/Preferences/com.frugoman.meetingflash.plist"

  caveats <<~EOS
    Open MeetingFlash from /Applications and allow calendar access when asked.
  EOS
end
