self: super: {
  python3 = super.python3.override {
    packageOverrides = python-self: python-super: {
      systemdunitparser = with super;
        callPackage ./pkgs/systemdunitparser.nix {
          python3Packages = python3Packages;
        };
    };
  };

  # python311.pkgs.override {
  #   systemdunitparser = with super;
  #     callPackage ./pkgs/systemdunitparser.nix {
  #       python3Packages = python311Packages;
  #     };
  # }
}
