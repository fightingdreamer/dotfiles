self: super: {
  python3 = super.python3.override {
    packageOverrides = python-self: python-super: {
      rlipython = with super;
        callPackage ./pkgs/rlipython.nix { python3Packages = python3Packages; };
      systemdunitparser = with super;
        callPackage ./pkgs/systemdunitparser.nix {
          python3Packages = python3Packages;
        };
    };
  };
}
