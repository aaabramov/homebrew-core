class Lxc < Formula
  desc "CLI client for interacting with LXD"
  homepage "https://linuxcontainers.org"
  url "https://linuxcontainers.org/downloads/lxd/lxd-3.19.tar.gz"
  sha256 "afc0b0912e5fa977007cfd97805849a3a47564eaaaa1638948081665ad7224c8"

  bottle do
    cellar :any_skip_relocation
    sha256 "084e150fd740e4570eee1e08c7cc3fff04474ecb8ce27fc50e31b0d0e1338464" => :catalina
    sha256 "e0d02332e50fd4e3f2c27adfc3f16a6022c5328ba989f29295e13bc91d7fe39b" => :mojave
    sha256 "f60a8d7311e4e3384257ded2f851389ab96ad72a44f26fa37e17db1e82f3baa2" => :high_sierra
  end

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GOBIN"] = bin

    ln_s buildpath/"_dist/src", buildpath/"src"
    system "go", "install", "-v", "github.com/lxc/lxd/lxc"
  end

  test do
    system "#{bin}/lxc", "--version"
  end
end
