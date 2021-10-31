class Jc < Formula
  include Language::Python::Virtualenv

  desc "Serializes the output of command-line tools to structured JSON output"
  homepage "https://github.com/kellyjonbrazil/jc"
  url "https://files.pythonhosted.org/packages/5f/90/0183a0bef6b05fd1a68234ea99dab72bde092f4cd83d8b52ad630b26f94a/jc-1.17.1.tar.gz"
  sha256 "946586414bd845c3d50000834d7625c7a057c982a3ceca7ab6edddc7d6a8fb75"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "61826076fc84d8cb9c37a8fed3d533a34481fc312ccdc20304caa67f4a65882c"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "950d2f985d3d11721a15c5b0e750f13d0400c02fb5a9cff97dbb8c3df68f3123"
    sha256 cellar: :any_skip_relocation, monterey:       "273ce8dfda76d4cc76d45d059e969c75a83cf98ba6f06323a4ec6dc581ed1c62"
    sha256 cellar: :any_skip_relocation, big_sur:        "13b96430280226ce2c59a63dc62db45b44b5ebb117d60c00f02527affbfc04c5"
    sha256 cellar: :any_skip_relocation, catalina:       "9db641ca35ab45421e6d5f00c27092375d973c2cfbd3104112cc719b718143d6"
    sha256 cellar: :any_skip_relocation, mojave:         "7b98e590f9094c97985ca3670047f5580a8a0c78559103e05c30dc32c7ccf935"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "a5d407532c31f8049262f849864d91b3f1194ca6eaced271d7f39d3cbfdea281"
  end

  depends_on "python@3.10"

  resource "Pygments" do
    url "https://files.pythonhosted.org/packages/b7/b3/5cba26637fe43500d4568d0ee7b7362de1fb29c0e158d50b4b69e9a40422/Pygments-2.10.0.tar.gz"
    sha256 "f398865f7eb6874156579fdf36bc840a03cab64d1cde9e93d68f46a425ec52c6"
  end

  resource "ruamel.yaml" do
    url "https://files.pythonhosted.org/packages/71/81/f597606e81f53eb69330e3f8287e9b5a3f7ed0481824036d550da705cd82/ruamel.yaml-0.17.16.tar.gz"
    sha256 "1a771fc92d3823682b7f0893ad56cb5a5c87c48e62b5399d6f42c8759a583b33"
  end

  resource "xmltodict" do
    url "https://files.pythonhosted.org/packages/58/40/0d783e14112e064127063fbf5d1fe1351723e5dfe9d6daad346a305f6c49/xmltodict-0.12.0.tar.gz"
    sha256 "50d8c638ed7ecb88d90561beedbf720c9b4e851a9fa6c47ebd64e99d166d8a21"
  end

  def install
    virtualenv_install_with_resources
    man1.install "man/jc.1"
  end

  test do
    assert_equal "[{\"header1\":\"data1\",\"header2\":\"data2\"}]\n", \
                  pipe_output("#{bin}/jc --csv", "header1, header2\n data1, data2")
  end
end
