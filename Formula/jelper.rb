class Jelper < Formula
  desc "Jira timesheet CLI — shows your worklogs grouped by week"
  homepage "https://github.com/VladasZ/jelper"
  url "https://github.com/VladasZ/jelper/releases/download/v0.1.12/jelper-macos"
  version "0.1.12"
  sha256 "8b044ab2250dc0e1e16fcc043f0b487ec51a0b3b1810a76c56884276dc22224f"

  def install
    bin.install "jelper-macos" => "jelper"
  end
end
