{
  pkgs,
  cwd,
  ...
}: {
  programs.nh = {
    enable = true;
    package = pkgs.nh;
    flake = "${cwd}";
  };
}
