# Homebrew tap for Tessaro

[Tessaro](https://github.com/alhafoudh/tessaro-os) is a web kiosk OS. This
tap installs its clients, which manage Tessaro devices from your computer.

```sh
brew install alhafoudh/tessaro/tessaro-ctl            # the command-line client
brew install --cask alhafoudh/tessaro/tessaro-gui     # the desktop app, Tessaro.app
brew install --cask alhafoudh/tessaro/try-tessaro     # a Tessaro device in a VM, Try Tessaro.app
```

The full name taps the repo and trusts the formula or cask in one step.
Homebrew refuses the short name (`brew install tessaro-ctl`) from a tap it
does not trust; `brew trust alhafoudh/tessaro` trusts the whole tap, after
which the short names work.

| | macOS (Apple silicon) | Linux x86_64 | Linux aarch64 |
| --- | --- | --- | --- |
| `tessaro-ctl` | yes | yes | yes |
| `tessaro-gui` | yes | from the [releases](https://github.com/alhafoudh/tessaro-os/releases) | from the [releases](https://github.com/alhafoudh/tessaro-os/releases) |
| `try-tessaro` | yes, macOS 13 or newer | no | no |

`brew upgrade` follows the releases of tessaro-os. Try Tessaro follows the
releases that build it, so it can stay a release behind the clients.

`Tessaro.app` and `Try Tessaro.app` are signed ad hoc and not notarized, so
the casks clear the quarantine flag after installing them. Otherwise macOS
would refuse to open them. `brew uninstall --zap try-tessaro` also deletes
the VM's disk and logs in `~/Library/Application Support/Try Tessaro`.

## Do not edit the formula or the casks here

Every tessaro-os release rewrites `Formula/tessaro-ctl.rb` and
`Casks/tessaro-gui.rb`, and `Casks/try-tessaro.rb` when it builds Try
Tessaro, from the templates in tessaro-os's `homebrew/` directory, so a
change made here is lost at the next release. Change the templates there
instead. How it works is in tessaro-os's `docs/ci.md`, section "Homebrew".
