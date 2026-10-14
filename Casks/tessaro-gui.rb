# Written by homebrew/render.rb in alhafoudh/tessaro-os on every release; an
# edit here is overwritten by the next one.
cask "tessaro-gui" do
  version "0.1.3-d0d7bf4"
  sha256 "4239f5eae56ade13418d79bb971f181a88b8b3487d89ae26db4f3fffc82b0016"

  url "https://github.com/alhafoudh/tessaro-os/releases/download/v#{version}/tessaro-gui-#{version}-macos-arm64.zip"
  name "Tessaro"
  desc "Desktop app to manage Tessaro kiosk devices"
  homepage "https://github.com/alhafoudh/tessaro-os"

  depends_on arch: :arm64
  depends_on :macos

  app "Tessaro.app"

  # Signed ad hoc, not notarized: Gatekeeper refuses a quarantined copy.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Tessaro.app"],
        writable_paths: ["Tessaro.app"],
        writable_base:  :appdir
  end

  # No zap: ~/.config/tessaro holds the devices and tokens tessaro-ctl
  # uses too.
end
