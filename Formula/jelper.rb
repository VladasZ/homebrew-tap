class Jelper < Formula
  desc "Jira timesheet CLI — shows your worklogs grouped by week"
  homepage "https://github.com/VladasZ/jelper"
  url "https://github.com/VladasZ/jelper/releases/download/v0.2.4/jelper-macos"
  version "0.2.4"
  sha256 "4dff801b76a46940acb283b76c34cca0a67d96b10a2065137004cc50111e4196"

  def install
    bin.install "jelper-macos" => "jelper"
  end
end
