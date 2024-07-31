class Iproute2mac < Formula
  include Language::Python::Shebang

  desc "CLI wrapper for basic network utilities on macOS - ip command"
  homepage "https://github.com/brona/iproute2mac"
  url "https://github.com/brona/iproute2mac/releases/download/v1.5.0/iproute2mac-1.5.0.tar.gz"
  sha256 "f842776ada1a51bb4a5c34e1e68471c85d7bf9f43511bdfef008074f82876a49"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "fe22f10cb5fd9b37009ee95ad78c6122952d43f33ea919247fc47f7f3f3530de"
  end

  depends_on :macos
  depends_on "python@3.12"

  def install
    bin.install "src/ip.py" => "ip"
    rewrite_shebang detected_python_shebang, bin/"ip"
  end

  test do
    system "#{bin}/ip", "route"
    system "#{bin}/ip", "address"
    system "#{bin}/ip", "neigh"
  end
end
