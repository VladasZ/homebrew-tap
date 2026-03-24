class Jelper < Formula
  desc "Jira timesheet CLI — shows your worklogs grouped by week"
  homepage "https://github.com/VladasZ/jelper"
  url "https://github.com/VladasZ/jelper/releases/download/vv0.0.1/jelper-macos"
  version "v0.0.1"
  sha256 "346e90f1997189885bd0e2fe12fd0e3c6300e6d20dff95eeabda79ea50cf3e15"

  def install
    bin.install "jelper-macos" => "jelper"
  end
end
