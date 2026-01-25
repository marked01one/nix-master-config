{pkgs, ...}: {
  # Periodic storage optimizations.
  nix.optimise.automatic = true;
  nix.optimise.dates = ["03:45"];

  # Garbage collection.
  nix.gc =
    if !pkgs.stdenv.isDarwin
    then {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    }
    else {
      automatic = true;
      interval = {
        Weekday = 0;
        Hour = 0;
        Minute = 0;
      };
      options = "--delete-older-than 14d";
    };
}
