class Jelper < Formula
  desc "Jira timesheet CLI — shows your worklogs grouped by week"
  homepage "https://github.com/VladasZ/jelper"
  url "https://github.com/VladasZ/jelper/releases/download/v0.2.3/jelper-macos"
  version "0.2.3"
  sha256 "9d52ed91a7c6ca5d30639f6a53dbc6400fb856277f981e08abe7e4ceb7cd532a"

  def install
    bin.install "jelper-macos" => "jelper"
  end
end
