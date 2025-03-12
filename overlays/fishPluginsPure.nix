final: prev: {
  fishPluginsPure = prev.fishPlugins.pure.overrideAttrs { checkPhase = ""; };
}
