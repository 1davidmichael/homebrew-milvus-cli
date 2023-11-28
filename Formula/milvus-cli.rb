class MilvusCli < Formula
    include Language::Python::Virtualenv

    desc "Milvus CLI"
    homepage "https://milvus.io/docs/cli_overview.md"

    url "https://files.pythonhosted.org/packages/db/d3/141e2bb58af96229fd89b9da8855eadc5cc50e54c091418b9009c2291d54/milvus_cli-0.4.0.tar.gz"
    sha256 "80c838a7783b38aeacf0957d88fed28a55a89d47202fd9bb254956290311049a"
    license "Apache-2.0"

    depends_on "python-setuptools" => :build
    depends_on "python@3.12"

    def python3
        which("python3.12")
    end

    def install
        virtualenv_install_with_resources
    end

    test do
        output = shell_output("#{bin}/milvus-cli --version")
        assert_match "Milvus_CLI v0.4.0", output
    end
end