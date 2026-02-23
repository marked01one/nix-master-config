# extract-options.nix
opts: let
  # This helper avoids evaluating "guarded" attributes that cause errors
  scrub = opt:
    if (builtins.isAttrs opt) && (opt._type or "" == "option")
    then {
      _name = toString opt;
      description = opt.description or null;
      type = opt.type.description or "unknown";
      example = opt.example or "no examples";
    }
    else if builtins.isAttrs opt
    then
      # Filter out internal metadata and problematic keys
      let
        filteredAttrs = builtins.removeAttrs opt ["_module" "__arg"];
      in
        builtins.mapAttrs (n: v: scrub v) filteredAttrs
    else null;
in
  scrub opts
