# Written by homebrew/render.rb in alhafoudh/tessaro-os on every release; an
# edit here is overwritten by the next one.
class TessaroCtl < Formula
  desc "Manage Tessaro kiosk devices from the command-line"
  homepage "https://github.com/alhafoudh/tessaro-os"
  version "0.1.3-d0d7bf4"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/alhafoudh/tessaro-os/releases/download/v0.1.3-d0d7bf4/tessaro-ctl-0.1.3-d0d7bf4-macos-arm64.tar.gz"
      sha256 "77f6c2200def6df0dc20770361047dbb03d0bae434262e9999677f875d226597"
    end
  end

  # Built on Ubuntu 22.04: glibc 2.35 and the system's libssl3.
  on_linux do
    on_intel do
      url "https://github.com/alhafoudh/tessaro-os/releases/download/v0.1.3-d0d7bf4/tessaro-ctl-0.1.3-d0d7bf4-linux-x86_64.tar.gz"
      sha256 "8b197c3c3e827f863ce84cd3e161b1d3ae1dec85f145749546aaf19991f895c1"
    end
    on_arm do
      url "https://github.com/alhafoudh/tessaro-os/releases/download/v0.1.3-d0d7bf4/tessaro-ctl-0.1.3-d0d7bf4-linux-aarch64.tar.gz"
      sha256 "a25f258f2da571bf0df07e4ebf5dd56b623c92b504c30821a7e359939c742cd4"
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
