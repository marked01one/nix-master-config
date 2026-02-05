{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    inputs.zen-browser.packages.${stdenv.hostPlatform.system}.default
  ];

  programs.zen-browser = {
    enable = true;
  };
}
