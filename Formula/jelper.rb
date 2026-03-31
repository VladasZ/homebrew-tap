class Jelper < Formula
  desc "Jira timesheet CLI — shows your worklogs grouped by week"
  homepage "https://github.com/VladasZ/jelper"
  url "https://github.com/VladasZ/jelper/releases/download/v0.2.0/jelper-macos"
  version "0.2.0"
  sha256 "226fa0c8f781da5a7837537fc7555a496a77636520de4a3bd381fdcc9423f87f"

  def install
    bin.install "jelper-macos" => "jelper"
  end
end
