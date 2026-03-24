class Jelper < Formula
  desc "Jira timesheet CLI — shows your worklogs grouped by week"
  homepage "https://github.com/VladasZ/jelper"
  url "https://github.com/VladasZ/jelper/releases/download/vv0.0.1/jelper-macos"
  version "v0.0.1"
  sha256 "6eb61979bc59560e1d8880da98b60e3b9b978b1628fc40a0dfe7d1e881c8464c"

  def install
    bin.install "jelper-macos" => "jelper"
  end
end
