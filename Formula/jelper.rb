class Jelper < Formula
  desc "Jira timesheet CLI — shows your worklogs grouped by week"
  homepage "https://github.com/VladasZ/jelper"
  url "https://github.com/VladasZ/jelper/releases/download/v0.1.11/jelper-macos"
  version "0.1.11"
  sha256 "4b857943d840598025c9549cd751785143ded9cbf25f4e51678f8e6f4654a09e"

  def install
    bin.install "jelper-macos" => "jelper"
  end
end
