class Cljfmt < Formula
  desc "A tool for formatting Clojure code"
  homepage "https://github.com/weavejester/cljfmt"
  version "0.16.1"

  on_linux do
    url "https://github.com/weavejester/cljfmt/releases/download/0.16.1/cljfmt-0.16.1-linux-amd64-static.tar.gz"
    sha256 "1ebe27f48b453fa298ec4a1b249fea15fa9546c7e11ae4c366d252e2b8c84582"
  end

  on_macos do
    url "https://github.com/weavejester/cljfmt/releases/download/0.16.1/cljfmt-0.16.1-darwin-aarch64.tar.gz"
    sha256 "37649399bfe22481be7558422e527065899bf5e1e4f7555db8ae63b8c6889749"
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
