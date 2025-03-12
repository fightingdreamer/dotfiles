{ lib, fetchFromGitHub, python3, python3Packages, }:
python3Packages.buildPythonPackage rec {
  pname = "rlipython";
  version = "0.1.2";

  src = fetchFromGitHub {
    owner = "ipython";
    repo = pname;
    rev = "e218435e396a5798e001f732afa5b5e5fdc93ce0";
    sha256 = "sha256-i/jKagLv1D2PEYlVqKcRQwjYSSSsMr70S2CTC1pe3UM=";
  };

  buildInputs = with python3.pkgs; [ ipython ];
  nativeBuildInputs = [ python3Packages.setuptools-scm ];
  propagatedBuildInputs = with python3.pkgs; [ ipython ];

  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/ipython/rlipython";
    description = "Readline Interface for IPython 5.4+";
    license = licenses.bsd3;
  };
}
