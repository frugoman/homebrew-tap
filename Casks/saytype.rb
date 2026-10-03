cask "saytype" do
  version "1.1.2"
  sha256 "db0687e6dc27af754cd033342880b1a578dd0569b27d2ecc790ef60eeb744199"

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
