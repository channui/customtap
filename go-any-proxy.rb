class GoAnyProxy < Formula
  desc "A transparent proxy written in Golang."
  homepage "https://github.com/ryanchapman/go-any-proxy"
  # This is the HEAD of the mac branch 
  url "https://api.github.com/repos/ryanchapman/go-any-proxy/tarball/09fb106"
  version "09fb106"
  sha256 "cf83bdea24a631651f492916cff0ba824c835744112aaf714e6f5ca52204a733"

  depends_on "go" => :build

  def install
    system "./make.bash"
    system "mkdir #{prefix}/bin"
    system "cp any_proxy #{prefix}/bin/any_proxy"
  end

  test do
    system "#{bin}/any_proxy | grep usage"
  end
end
