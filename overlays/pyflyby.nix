self: super: {
  pyflyby = with super;
    callPackage ./pkgs/pyflyby.nix { python3Packages = python3Packages; };
}
