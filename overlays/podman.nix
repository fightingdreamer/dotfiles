final: prev: {
  podman = prev.podman.overrideAttrs (attrs: {
    binPath = prev.lib.makeBinPath
      (prev.lib.optionals prev.stdenv.hostPlatform.isLinux [
        prev.fuse-overlayfs
        prev.util-linuxMinimal
        prev.iproute2
      ] ++ prev.lib.optionals prev.stdenv.hostPlatform.isDarwin [
        # prev.vfkit  # Disabled due to build failures on macOS 12
      ] ++ attrs.extraPackages or [ ]);
  });
}
