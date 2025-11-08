class Soundctl < Formula
  desc "Command-line utility to control sound devices on macOS"
  homepage "https://github.com/graysoncash/soundctl"
  url "https://github.com/graysoncash/soundctl/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "3bd9aa17a193bd57b0b7a545858a9c65ccc2f3c1be5850872bc98b77b5f08dc8"
  license "MIT"
  head "https://github.com/graysoncash/soundctl.git", branch: "main"

  depends_on xcode: ["14.0", :build]
  depends_on :macos

  def install
    system "bash", "scripts/generate-version.sh"
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/soundctl"
  end

  test do
    assert_match "soundctl", shell_output("#{bin}/soundctl --help")
    assert_match version.to_s, shell_output("#{bin}/soundctl --version")
  end
end
