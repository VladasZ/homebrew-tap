class Jelper < Formula
  desc "Jira timesheet CLI — shows your worklogs grouped by week"
  homepage "https://github.com/VladasZ/jelper"
  url "https://github.com/VladasZ/jelper/releases/download/v0.1.5/jelper-macos"
  version "0.1.5"
  sha256 "0fda12975dd4df29a79eca2db3448e3e30b4e3ada4772fd4616b507545abe0c3"

  def install
    bin.install "jelper-macos" => "jelper"
  end
end
