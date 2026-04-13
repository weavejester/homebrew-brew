class Cljfmt < Formula
  desc "A tool for formatting Clojure code"
  homepage "https://github.com/weavejester/cljfmt"
  version "0.16.4"

  on_linux do
    url "https://github.com/weavejester/cljfmt/releases/download/0.16.4/cljfmt-0.16.4-linux-amd64-static.tar.gz"
    sha256 "58466729a374f773d02a810e1c53a524c63dc00796573549785d1d7f6a283c7a"
  end

  on_macos do
    url "https://github.com/weavejester/cljfmt/releases/download/0.16.4/cljfmt-0.16.4-darwin-aarch64.tar.gz"
    sha256 "475f779f1534c2a1113c10c12bc69b0e4c1c3f47d6f5f1d70037e1e75776c658"
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
