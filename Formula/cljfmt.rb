class Cljfmt < Formula
  desc "A tool for formatting Clojure code"
  homepage "https://github.com/weavejester/cljfmt"
  version "0.16.2"

  on_linux do
    url "https://github.com/weavejester/cljfmt/releases/download/0.16.2/cljfmt-0.16.2-linux-amd64-static.tar.gz"
    sha256 "e653468a7d8e0f23b6344d0c4ea1446eb6072b46ff0f87675ccbe6f43b987cc6"
  end

  on_macos do
    url "https://github.com/weavejester/cljfmt/releases/download/0.16.2/cljfmt-0.16.2-darwin-aarch64.tar.gz"
    sha256 "e59d2d0f3f62829b3f54ad302b34d39a363d447c10af9a09e90c4c27abb0d89d"
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
