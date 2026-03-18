class Cljfmt < Formula
  desc "A tool for formatting Clojure code"
  homepage "https://github.com/weavejester/cljfmt"
  version "0.16.3"

  on_linux do
    url "https://github.com/weavejester/cljfmt/releases/download/0.16.3/cljfmt-0.16.3-linux-amd64-static.tar.gz"
    sha256 "dff7cde3ff57e09a148359fe8598681bca6c27c8f67c7ff9a1cf8ec0aaecfe50"
  end

  on_macos do
    url "https://github.com/weavejester/cljfmt/releases/download/0.16.3/cljfmt-0.16.3-darwin-aarch64.tar.gz"
    sha256 "35222795a8dc3fdb6ea117912e7de205d4a142f90c741ed84f6f4b2b478a2310"
  end

  def install
    bin.install "cljfmt"
  end

  test do
    testfile = testpath/"test.clj"
    testfile.write "(defn foo [x]\nx)\n"
    assert_match "1 file(s) formatted incorrectly"
                 shell_output("#{bin}/cljfmt check #{testfile} 2>&1")
  end
end
