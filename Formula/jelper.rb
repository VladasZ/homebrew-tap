class Jelper < Formula
  desc "Jira timesheet CLI — shows your worklogs grouped by week"
  homepage "https://github.com/VladasZ/jelper"
  url "https://github.com/VladasZ/jelper/releases/download/vv0.0.)/jelper-macos"
  version "v0.0.)"
  sha256 "93f2187d4e07748a7f4743605e3d05fd407d196e839aeabb89f9559745ec9e3d"

  def install
    bin.install "jelper-macos" => "jelper"
  end
end
