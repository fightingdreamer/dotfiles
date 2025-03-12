final: prev: {
  msgpack-tools = prev.msgpack-tools.overrideAttrs (attrs: {
    meta = attrs.meta or { } // { platforms = prev.lib.platforms.unix; };
  });
}
