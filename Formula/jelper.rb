class Jelper < Formula
  desc "Jira timesheet CLI — shows your worklogs grouped by week"
  homepage "https://github.com/VladasZ/jelper"
  url "https://github.com/VladasZ/jelper/releases/download/v0.1.4/jelper-macos"
  version "0.1.4"
  sha256 "57cfa89ded2912c88b6c7b68b6f9241c0ddc9782b002bc268d228c83011dee6f"

  def install
    bin.install "jelper-macos" => "jelper"
  end
end
