# Written by homebrew/render.rb in alhafoudh/tessaro-os on every release; an
# edit here is overwritten by the next one.
class TessaroCtl < Formula
  desc "Manage Tessaro kiosk devices from the command-line"
  homepage "https://github.com/alhafoudh/tessaro-os"
  version "0.1.5-c2f1923"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/alhafoudh/tessaro-os/releases/download/v0.1.5-c2f1923/tessaro-ctl-0.1.5-c2f1923-macos-arm64.tar.gz"
      sha256 "0e1fa5baf69d5c56219758a8f0d19e18e92e9ad721cf68016cfc325d371042b2"
    end
  end

  # Built on Ubuntu 22.04: glibc 2.35 and the system's libssl3.
  on_linux do
    on_intel do
      url "https://github.com/alhafoudh/tessaro-os/releases/download/v0.1.5-c2f1923/tessaro-ctl-0.1.5-c2f1923-linux-x86_64.tar.gz"
      sha256 "62e6a72472d6f75281c39385cb5a027b0502e6995eb15ae7257ee98dbad1ab18"
    end
    on_arm do
      url "https://github.com/alhafoudh/tessaro-os/releases/download/v0.1.5-c2f1923/tessaro-ctl-0.1.5-c2f1923-linux-aarch64.tar.gz"
      sha256 "c848a325adb2bfbfdc61a07f1ab86a1b2494068ba9f2ee6b0c60c76438084c7c"
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
