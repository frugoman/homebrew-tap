cask "impact-capture" do
  version "1.1.0"
  sha256 "20fc6f342d63d826ab055c58552e2c068a5c618ac66186f5325f6c1a206937de"

  url "https://github.com/frugoman/homebrew-tap/releases/download/impact-capture-v#{version}/Impact-Capture-#{version}.zip"
  name "Impact Capture"
  desc "Menu bar app that captures the work that never makes it into a commit"
  homepage "https://github.com/frugoman/homebrew-tap"

  depends_on macos: :sequoia

  app "Impact Capture.app"

  # The app is not notarized, so drop the quarantine flag to let Gatekeeper open it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Impact Capture.app"],
                          writable_paths: ["Impact Capture.app"], writable_base: :appdir
  end

  uninstall quit: "com.nicolasfrugoni.ImpactCapture"

  # Your captures folder is yours and is never removed.
  zap trash: "~/Library/Preferences/com.nicolasfrugoni.ImpactCapture.plist"

  caveats <<~EOS
    Open Impact Capture from /Applications to pick a captures folder and set your shortcuts.
  EOS
end
