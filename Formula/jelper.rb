class Jelper < Formula
  desc "Jira timesheet CLI — shows your worklogs grouped by week"
  homepage "https://github.com/VladasZ/jelper"
  url "https://github.com/VladasZ/jelper/releases/download/v0.2.2/jelper-macos"
  version "0.2.2"
  sha256 "3acb568ad745a7755524fea267b5f1da30103d372d05740dc88e854a16415fc5"

  def install
    bin.install "jelper-macos" => "jelper"
  end
end
