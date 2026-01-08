{
  # Creates key binding by generating all possible prefix-suffix combinations
  # based on the inputted suffixes and prefixes.
  # CODE REFERENCE: https://github.com/sodiboo/system/personal/niri.mod.nix#L31

  generate-binds = {
    suffixes,
    prefixes,
    substitutions ? {},
  }: let
    # Define replacer function to replace strings defined in `substitutions`.
    replacer =
      builtins.replaceStrings
      # Substrings to replace.
      (builtins.attrNames substitutions)
      # Substrings for the replacer to replace to.
      (builtins.attrValues substitutions);

    # Format the prefixes and suffixes to generate pairings.
    format = prefix: suffix: let
      actual-suffix =
        if builtins.isList suffix.action
        then {
          action = builtins.head suffix.action;
          args = builtins.tail suffix.action;
        }
        else {
          inherit (suffix) action;
          args = [];
        };

      action = replacer "${prefix.action}-${actual-suffix.action}";
    in {
      name = "${prefix.key}+${suffix.key}";
      value.action.${action} = actual-suffix.args;
    };

    # Pair the generated attribute key with their respective actions as value.
    pairs = attrs: fn:
      builtins.concatMap (key:
        fn {
          inherit key; # `key = key;`
          action = attrs.${key};
        })
      (builtins.attrNames attrs);
  in
    builtins.listToAttrs (
      pairs
      prefixes
      (prefix: pairs suffixes (suffix: [(format prefix suffix)]))
    );
}
