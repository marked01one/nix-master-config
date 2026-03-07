# Install and configure `zsh`.
{...}: {
  programs.zsh.enable = true;
  environment.pathsToLink = ["/share/zsh"];

  # Shell script code called during zsh shell initialisation.
  programs.zsh.shellInit = ''
    if [[ $- == *i* ]]
    then
      fastfetch
    fi
  '';
}
