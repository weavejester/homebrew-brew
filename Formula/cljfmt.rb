class Cljfmt < Formula
  desc "A tool for formatting Clojure code"
  homepage "https://github.com/weavejester/cljfmt"
  version "0.16.5"

  on_linux do
    url "https://github.com/weavejester/cljfmt/releases/download/0.16.5/cljfmt-0.16.5-linux-amd64-static.tar.gz"
    sha256 "45af8035c2659207ee20890ad529b3bc105aaab477b529f52ff5234036316f3a"
  end

  on_macos do
    url "https://github.com/weavejester/cljfmt/releases/download/0.16.5/cljfmt-0.16.5-darwin-aarch64.tar.gz"
    sha256 "e6f4bd980c867cd6af5fb8cd29c4d7e68e5e0185fd015eab72604902b010bb95"
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
