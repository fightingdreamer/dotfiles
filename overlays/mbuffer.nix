final: prev: {
  mbuffer = prev.mbuffer.overrideAttrs (attrs: {
    meta = attrs.meta or { } // { platforms = prev.lib.platforms.unix; };
  });
}
