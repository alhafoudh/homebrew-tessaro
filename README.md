# Homebrew tap for Tessaro

[Tessaro](https://github.com/alhafoudh/tessaro-os) is a web kiosk OS. This
tap installs its clients, which manage Tessaro devices from your computer.

```sh
brew tap alhafoudh/tessaro
brew install tessaro-ctl            # the command-line client
brew install --cask tessaro-gui     # the desktop app, Tessaro.app
```

| | macOS (Apple silicon) | Linux x86_64 | Linux aarch64 |
| --- | --- | --- | --- |
| `tessaro-ctl` | yes | yes | yes |
| `tessaro-gui` | yes | from the [releases](https://github.com/alhafoudh/tessaro-os/releases) | from the [releases](https://github.com/alhafoudh/tessaro-os/releases) |

`brew upgrade` follows the releases of tessaro-os.

`Tessaro.app` is signed ad hoc and not notarized, so the cask clears the
quarantine flag after installing it. Otherwise macOS would refuse to open it.

## Do not edit the formula or the cask here

Every tessaro-os release rewrites `Formula/tessaro-ctl.rb` and
`Casks/tessaro-gui.rb` from the templates in tessaro-os's `homebrew/`
directory, so a change made here is lost at the next release. Change the
templates there instead. How it works is in tessaro-os's `docs/ci.md`,
section "Homebrew".
