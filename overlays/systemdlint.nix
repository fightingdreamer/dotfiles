self: super: {
  systemdlint = with super;
    callPackage ./pkgs/systemdlint.nix { python3Packages = python3Packages; };
}
