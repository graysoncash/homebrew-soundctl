class Soundctl < Formula
  desc "Command-line utility to control sound devices on macOS"
  homepage "https://github.com/graysoncash/soundctl"
  url "https://github.com/graysoncash/soundctl/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "9a329e260f3943de1ec34d95e6c7ece0f69d5470d0a003848f7543c4e43ab220"
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
