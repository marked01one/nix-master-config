{ ... }:

{
  # Creates key binding by generating all possible prefix-suffix combinations based on
  # the inputted suffixes and prefixes.
  # CODE REFERENCE: https://github.com/sodiboo/system/personal/niri.mod.nix#L31
  generate-binds =
    { suffixes, prefixes, substitutions ? { } }:
    let
      # Define replacer function to replace strings defined in `substitutions`.
      replacer = builtins.replaceStrings
        (builtins.attrNames substitutions)   # Substrings to replace
        (builtins.attrValues substitutions); # Substrings for the replacer to replace to.
      format =
        prefix: suffix:
        let
          actual-suffix =
            if isList suffix.action then
              {
                action = head suffix.action;
                args = tail suffix.action;
              }
            else
              {
                inherit (suffix) action;
                args = [ ];
              };

          action = replacer "${prefix.action}-${actual-suffix.action}";
        in
        {
          name = "${prefix.key}+${suffix.key}";
          value.action.${action} = actual-suffix.args;
        };
      pairs = attrs: fn:
        concatMap (key: fn {
          inherit key;  # `key = key;`
          action = attrs.${key};
        })
        (builtins.attrNames attrs);
    in
      builtins.listToAttrs (pairs
        prefixes
        (prefix: pairs suffixes (suffix: [ (format prefix suffix) ]))
      );

}
