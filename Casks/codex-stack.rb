cask "codex-stack" do
  version "0.0.10"
  sha256 "0f2a7111d86c529a1e4260c5a26bd272ee4857d3e81a4a33685447caba86d5a4"

  url "https://github.com/ocd0711/CodexStack/releases/download/v#{version}/codexStack-v#{version}-macos.zip",
      verified: "github.com/ocd0711/CodexStack/"
  name "codexStack"
  desc "Native macOS menu bar app for managing local Codex sessions"
  homepage "https://github.com/ocd0711/CodexStack"

  livecheck do
    url "https://github.com/ocd0711/CodexStack"
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "codexStack.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/codexStack.app"],
                   sudo:         false,
                   must_succeed: false,
                   print_stdout: false,
                   print_stderr: false
    system_command "/usr/bin/open",
                   args:         ["-a", "#{appdir}/codexStack.app"],
                   must_succeed: false,
                   print_stdout: false,
                   print_stderr: false
  end

  uninstall quit: "dev.codexstack.app"

  zap trash: [
    "~/Library/Preferences/dev.codexstack.app.plist",
    "~/Library/Saved Application State/dev.codexstack.app.savedState",
  ]
end
