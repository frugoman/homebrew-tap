cask "saytype" do
  version "1.1.3"
  sha256 "2a933f0d9d37aa71c8b07ae9adfb98bd0c355ae3f94a0b815f4eeb8824e90bd0"

  url "https://github.com/frugoman/homebrew-tap/releases/download/saytype-v#{version}/SayType-#{version}.zip"
  name "SayType"
  desc "Hands-free, fully local dictation: click into a text field and talk"
  homepage "https://frugoman.github.io/saytype-site/"

  depends_on macos: :sonoma

  app "SayType.app"
  binary "#{appdir}/SayType.app/Contents/Resources/CLI/saytype"

  uninstall quit: "com.nicolasfrugoni.saytype"

  zap trash: [
    "~/Library/Preferences/com.nicolasfrugoni.saytype.plist",
    "~/Library/Application Support/SayType",
  ]

  caveats <<~EOS
    Open SayType from /Applications and grant Microphone and Accessibility access.
    The speech model (~630 MB) downloads once on first launch.

    The saytype command is installed too. Run: saytype help
    Recording a meeting also needs Screen & System Audio Recording access
    (System Settings > Privacy & Security). Dictation does not.
  EOS
end
