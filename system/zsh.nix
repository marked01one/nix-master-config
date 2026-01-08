# Install and configure `zsh`.
{...}: {
  programs.zsh.enable = true;
  environment.pathsToLink = ["/share/zsh"];
}
