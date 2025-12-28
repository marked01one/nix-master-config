{pkgs, ...}: {
  programs.pandoc = {
    enable = true;
    package = pkgs.pandoc;
  };
}
