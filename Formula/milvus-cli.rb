class MilvusCli < Formula
    include Language::Python::Virtualenv

    desc "Milvus CLI"
    homepage "https://milvus.io/docs/cli_overview.md"

    url "https://files.pythonhosted.org/packages/db/d3/141e2bb58af96229fd89b9da8855eadc5cc50e54c091418b9009c2291d54/milvus_cli-0.4.0.tar.gz"
    sha256 "80c838a7783b38aeacf0957d88fed28a55a89d47202fd9bb254956290311049a"
    license "Apache-2.0"

    depends_on "python-setuptools" => :build
    depends_on "python@3.12"
    depends_on "python-tabulate"
    depends_on "python-click"
    depends_on "python-requests"
    depends_on "numpy"

    resource "pymilvus" do
        url "https://files.pythonhosted.org/packages/60/dc/91b213ea488546b01f58458816c6bb57cb4646c4d2f95113361f98413e7b/pymilvus-2.2.17.tar.gz"
        sha256 "fadb4bb33a84a8edde45f692f86a0b8c5d309a0aeba56db3564f271df8496347"
    end

    resource "grpcio" do
        url "https://files.pythonhosted.org/packages/ab/a1/f838646e25402eb750f037cf84c1ada46084717375e44724c89900ee4c7d/grpcio-1.59.3.tar.gz"
        sha256 "7800f99568a74a06ebdccd419dd1b6e639b477dcaf6da77ea702f8fb14ce5f80"
    end

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