{ lib, fetchFromGitHub, python3Packages, }:
python3Packages.buildPythonPackage rec {
  pname = "systemdunitparser";
  version = "0.2";

  src = fetchFromGitHub {
    owner = "sgallagher";
    repo = pname;
    rev = version;
    sha256 = "sha256-rZyTSEcrCvsKNl8EM/Ou4rrTdLZFxsb+vKFWiYm4dGI=";
  };

  nativeBuildInputs = [ python3Packages.setuptools-scm ];
  propagatedBuildInputs = [ python3Packages.setuptools ];
  pytestFlagsArray = [ "tests/" ];
  nativeCheckInputs = [ python3Packages.pytestCheckHook ];
  pythonImportsCheck = [ "SystemdUnitParser" ];

  meta = with lib; {
    homepage = "https://github.com/sgallagher/systemdunitparser";
    description =
      "SystemdUnitParser is an extension to Python's configparser.RawConfigParser to properly parse systemd unit files";
    license = licenses.gpl3;
  };
}
