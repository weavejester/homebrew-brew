class Cljfmt < Formula
  desc "A tool for formatting Clojure code"
  homepage "https://github.com/weavejester/cljfmt"
  version "0.15.6"

  if OS.linux?
    url "https://github.com/weavejester/cljfmt/releases/download/0.15.6/cljfmt-0.15.6-linux-amd64-static.tar.gz"
    sha256 "168a898d87211cd1c0c60dbb403b93a3846622daacc78066ec6fb99df101b4af"
  else
    if Hardware::CPU.arm?
      url "https://github.com/weavejester/cljfmt/releases/download/0.15.6/cljfmt-0.15.6-darwin-aarch64.tar.gz"
      sha256 "26154cb0a8fc561cbfbd33188f1bf2190759f42f5a071f8828d475230aa3f38c"
    else
      url "https://github.com/weavejester/cljfmt/releases/download/0.15.6/cljfmt-0.15.6-darwin-amd64.tar.gz"
      sha256 "ff7cdb37cc22854a618d35e28d381904b44bafdd951f9e0019230f7adeb67f00"
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
