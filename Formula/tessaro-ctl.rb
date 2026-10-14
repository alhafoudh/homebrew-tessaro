# Written by homebrew/render.rb in alhafoudh/tessaro-os on every release; an
# edit here is overwritten by the next one.
class TessaroCtl < Formula
  desc "Manage Tessaro kiosk devices from the command-line"
  homepage "https://github.com/alhafoudh/tessaro-os"
  version "0.1.4-e3f34d0"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/alhafoudh/tessaro-os/releases/download/v0.1.4-e3f34d0/tessaro-ctl-0.1.4-e3f34d0-macos-arm64.tar.gz"
      sha256 "28237a7f07b7e194b9181257adac74d1c3999817180f158aed9d8eb8a80df6f3"
    end
  end

  # Built on Ubuntu 22.04: glibc 2.35 and the system's libssl3.
  on_linux do
    on_intel do
      url "https://github.com/alhafoudh/tessaro-os/releases/download/v0.1.4-e3f34d0/tessaro-ctl-0.1.4-e3f34d0-linux-x86_64.tar.gz"
      sha256 "3a123adbf39da4e51b91e0b6baff803fc14fd9de16642db0e6de4ec35a3c6d00"
    end
    on_arm do
      url "https://github.com/alhafoudh/tessaro-os/releases/download/v0.1.4-e3f34d0/tessaro-ctl-0.1.4-e3f34d0-linux-aarch64.tar.gz"
      sha256 "e2743bb38fd53b7e415b512c6eb41da640e29e52e11a7b797729eb9da7ce65c2"
    end
  end

  def install
    bin.install "tessaro-ctl"
    generate_completions_from_executable(bin/"tessaro-ctl", "completion", shells: [:bash, :zsh])
  end

  test do
    assert_match(/^tessaro-ctl \d+\.\d+\.\d+$/, shell_output("#{bin}/tessaro-ctl --version"))
  end
end
