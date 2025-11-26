class Cljfmt < Formula
  desc "A tool for formatting Clojure code"
  homepage "https://github.com/weavejester/cljfmt"
  version "${VERSION}"

  if OS.linux?
    url "https://github.com/weavejester/cljfmt/releases/download/${VERSION}/cljfmt-${VERSION}-linux-amd64-static.tar.gz"
    sha256 "${LINUX_SHA}"
  else
    if Hardware::CPU.arm?
      url "https://github.com/weavejester/cljfmt/releases/download/${VERSION}/cljfmt-${VERSION}-darwin-aarch64.tar.gz"
      sha256 "${MACOS_ARM_SHA}"
    else
      url "https://github.com/weavejester/cljfmt/releases/download/${VERSION}/cljfmt-${VERSION}-darwin-amd64.tar.gz"
      sha256 "${MACOS_AMD_SHA}"
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
