class Soundctl < Formula
  desc "Command-line utility to control sound devices on macOS"
  homepage "https://github.com/graysoncash/soundctl"
  url "https://github.com/graysoncash/soundctl/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "5a50b03d2ceb04f53ed142dbfb1d71597f6af4c7ca39437f9f880c6de895bf64"
  license "MIT"
  head "https://github.com/graysoncash/soundctl.git", branch: "main"

  depends_on xcode: ["14.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/soundctl"
  end

  test do
    assert_match "soundctl", shell_output("#{bin}/soundctl --help")
  end
end
