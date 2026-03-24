class Jelper < Formula
  desc "Jira timesheet CLI — shows your worklogs grouped by week"
  homepage "https://github.com/VladasZ/jelper"
  url "https://github.com/VladasZ/jelper/releases/download/#{version}/jelper-macos"
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  def install
    bin.install "jelper-macos" => "jelper"
  end
end
