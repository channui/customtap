# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class GoAnyProxy < Formula
  desc "A transparent proxy written in Golang."
  homepage "https://github.com/ryanchapman/go-any-proxy"
  # This is the HEAD of the mac branch 
  url "https://api.github.com/repos/ryanchapman/go-any-proxy/tarball/09fb106"
  version "09fb106"
  sha256 "cf83bdea24a631651f492916cff0ba824c835744112aaf714e6f5ca52204a733"

  # depends_on "cmake" => :build
  depends_on "go" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    system "./make.bash"
    system "mkdir #{prefix}/bin"
    system "cp any_proxy #{prefix}/bin/any_proxy"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test go-any-proxy`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "#{bin}/any_proxy | grep usage"
  end
end
