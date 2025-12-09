{ pkgs, ... }:

{
  fcp = pkgs.writeShellApplication {
    name = "fcp";
    runtimeInputs = with pkgs; [ xclip ];
    # Read the text of the shell script from an external file.
    text = builtins.readFile ./../scripts/fcp.sh;
  };

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

  show-colors = pkgs.writeShellApplication {
    name = "show-colors";
    # Read the text of the shell script from an external file.
    text = builtins.readFile ./../scripts/show-colors.sh;
  };

  print-theme = pkgs.writeShellApplication {
    name = "print-theme";
    text = builtins.readFile ./../scripts/print-theme.sh;
  };
}
