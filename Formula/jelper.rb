class Jelper < Formula
  desc "Jira timesheet CLI — shows your worklogs grouped by week"
  homepage "https://github.com/VladasZ/jelper"
  url "https://github.com/VladasZ/jelper/releases/download/v0.1.14/jelper-macos"
  version "0.1.14"
  sha256 "5e4a83c29d9dc66c4701738b850a62de43adffc795e0634854dd229a679447ca"

  def install
    bin.install "jelper-macos" => "jelper"
  end
end
