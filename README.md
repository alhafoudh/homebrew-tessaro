# Homebrew tap for Tessaro

[Tessaro](https://github.com/alhafoudh/tessaro-os) is a web kiosk OS. This
tap installs its clients, which manage Tessaro devices from your computer.

```sh
brew install alhafoudh/tessaro/tessaro-ctl            # the command-line client
brew install --cask alhafoudh/tessaro/tessaro-gui     # the desktop app, Tessaro.app
```

The full name taps the repo and trusts the formula or cask in one step.
Homebrew refuses the short name (`brew install tessaro-ctl`) from a tap it
does not trust; `brew trust alhafoudh/tessaro` trusts the whole tap, after
which the short names work.

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
