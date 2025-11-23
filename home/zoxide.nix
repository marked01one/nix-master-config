{ config, pkgs, ... }:

{
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    package = pkgs.unstable.zoxide;
    options = [
      "--cmd cd"  # Replace `cd` with zoxide commands.
      "--hook pwd"  # Change a directory's score whenever the `pwd` changes.
    ];
  };
}
