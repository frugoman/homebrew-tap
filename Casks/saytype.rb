cask "saytype" do
  version "1.1.0"
  sha256 "14496a4c9ce393b9c2cdee280be4bf8bd52b487d9036ba8ccc45bf92ef82d59f"

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
