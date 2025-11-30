{ pkgs, ... }:

{
  nix-submit = pkgs.writeShellApplication {
    name = "nix-submit";
    runtimeInputs = with pkgs; [ git neovim grep ];
    # Read the text of the shell script from an external file.
    text = builtins.readFile ./../scripts/nix-submit.sh;
  };

  hello = pkgs.writeShellApplication {
    name = "hello";
    runtimeInputs = with pkgs; [ cowsay lolcat ];
    # Read the text of the shell script from an external file.
    text = builtins.readFile ./../scripts/hello.sh;
  };
}
