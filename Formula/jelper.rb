class Jelper < Formula
  desc "Jira timesheet CLI — shows your worklogs grouped by week"
  homepage "https://github.com/VladasZ/jelper"
  url "https://github.com/VladasZ/jelper/releases/download/v0.1.15/jelper-macos"
  version "0.1.15"
  sha256 "9273904de38c55b196e8107b36dc741db00c9c766ac77aa16db2c6f18d5f8fe1"

  def install
    bin.install "jelper-macos" => "jelper"
  end
end
