# Import all nix files in the current folder,
# and execute them with arguments as parameters.
with builtins;
(map (f: (import (./. + "/${f}")))
  (filter (name: name != "default.nix" && !isNull (match ".*[.]nix" name))
    (attrNames (readDir ./.))))
