class Soundctl < Formula
  desc "Command-line utility to control sound devices on macOS"
  homepage "https://github.com/graysoncash/soundctl"
  url "https://github.com/graysoncash/soundctl/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0e29562c6fc0cfd506fe30efb1aa980d7ccef363665dee0719d8fd605c6d8f55"
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
