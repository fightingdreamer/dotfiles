# import all nix files in the current folder,
# and execute them with args as parameters
with builtins;
(map (f: (import (./. + "/${f}")))
  (filter (name: name != "default.nix" && !isNull (match ".*[.]nix" name))
    (attrNames (readDir ./.))))
