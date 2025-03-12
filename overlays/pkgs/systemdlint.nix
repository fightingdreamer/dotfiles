{ lib, python3, python3Packages, }:
python3Packages.buildPythonApplication rec {
  pname = "systemdlint";
  version = "1.2.1";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "596b60c654f807e552ce3b2f70d7e7a2a11c7f074f87978f4b3801641fe4483b";
  };

  propagatedBuildInputs = with python3.pkgs; [ anytree systemdunitparser ];

  meta = with lib; {
    homepage = "https://github.com/priv-kweihmann/systemdlint";
    description = "Systemd Unitfile Linter";
    license = licenses.bsd2;
  };
}
