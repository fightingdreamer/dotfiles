final: prev: {
  blackd = prev.black.overrideDerivation (old: {
    propagatedBuildInputs = old.propagatedBuildInputs
      ++ old.optional-dependencies.d;
  });
}
