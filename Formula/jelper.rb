class Jelper < Formula
  desc "Jira timesheet CLI — shows your worklogs grouped by week"
  homepage "https://github.com/VladasZ/jelper"
  url "https://github.com/VladasZ/jelper/releases/download/v0.2.5/jelper-macos"
  version "0.2.5"
  sha256 "dff66e2510dde86462d6c95921e480696b7734f8fc696ffbf29d17fe14253f2c"

  def install
    bin.install "jelper-macos" => "jelper"
  end
end
