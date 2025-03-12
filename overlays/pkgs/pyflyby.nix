{ python3Packages, lib, fetchPypi, python3, }:
python3Packages.buildPythonApplication rec {
  pname = "pyflyby";
  version = "1.8.8";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-5Hw9R9r7ckvOJuFT4ZHaXuzmlTnoyXbJwVmKb35z7mo=";
  };

  buildInputs = with python3.pkgs; [
    ipython
    flaky
    requests
    pexpect
    # epydoc
    rlipython
  ];
  propagatedBuildInputs = with python3.pkgs; [ six toml isort black ipython ];

  nativeBuildInputs = [ python3Packages.setuptools-scm ];
  pytestFlagsArray = [ "tests/" "--verbose" ];
  disabledTestPaths = [ "tests/test_interactive.py" ];
  nativeCheckInputs = [ python3Packages.pytestCheckHook ];

  doCheck = false;

  meta = with lib; {
    homepage = "https://deshaw.github.io/pyflyby/";
    description = "A set of productivity tools for Python";
    license = licenses.mit;
  };
}
