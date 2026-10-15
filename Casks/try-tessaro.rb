# Written by homebrew/render.rb in alhafoudh/tessaro-os on every release that
# builds Try Tessaro; an edit here is overwritten by the next one.
cask "try-tessaro" do
  version "0.1.4-e3f34d0"
  sha256 "41df3fb45b1d2cbebc0ef2ca744bf23cbe7f719ea31ca4c150ec807019720bd5"

  url "https://github.com/alhafoudh/tessaro-os/releases/download/v#{version}/try-tessaro-#{version}-macos-arm64.dmg"
  name "Try Tessaro"
  desc "Tessaro kiosk device in a virtual machine"
  homepage "https://github.com/alhafoudh/tessaro-os"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Try Tessaro.app"

  # Signed ad hoc, not notarized: Gatekeeper refuses a quarantined copy.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Try Tessaro.app"],
        writable_paths: ["Try Tessaro.app"],
        writable_base:  :appdir
  end

  # The device's disk and logs. ~/.config/tessaro stays: tessaro-ctl and
  # tessaro-gui keep their devices there too.
  zap trash: "~/Library/Application Support/Try Tessaro"
end
