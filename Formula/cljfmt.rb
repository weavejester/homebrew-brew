class Cljfmt < Formula
  desc "A tool for formatting Clojure code"
  homepage "https://github.com/weavejester/cljfmt"
  version "0.16.0"

  if OS.linux?
    url "https://github.com/weavejester/cljfmt/releases/download/0.16.0/cljfmt-0.16.0-linux-amd64-static.tar.gz"
    sha256 "2e71751011505dda6d2735464f50bf64f11f47a01f353309666fd7a3d8fd15fd"
  else
    if Hardware::CPU.arm?
      url "https://github.com/weavejester/cljfmt/releases/download/0.16.0/cljfmt-0.16.0-darwin-aarch64.tar.gz"
      sha256 "f6558d864c2cf73e9e26bccd3e599aad79a27c614ca66c1eb2febe36dc635df5"
    else
      url "https://github.com/weavejester/cljfmt/releases/download/0.16.0/cljfmt-0.16.0-darwin-amd64.tar.gz"
      sha256 "7407c1d3b74b698b0bd6da9bbbe9a7cf6c4747a0b2219a2040eef07b99efee51"
    end
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
