class Jelper < Formula
  desc "Jira timesheet CLI — shows your worklogs grouped by week"
  homepage "https://github.com/VladasZ/jelper"
  url "https://github.com/VladasZ/jelper/releases/download/v0.2.1/jelper-macos"
  version "0.2.1"
  sha256 "74506e8663e108129109c33406fbe8cdd69b1518db2d2256eeb9c5919bd435f7"

  def install
    bin.install "jelper-macos" => "jelper"
  end
end
