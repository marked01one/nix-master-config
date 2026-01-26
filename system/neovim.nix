{...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withRuby = true;
    withPython3 = true;
    withNodeJs = true;

    # Symlink `vim` and `vi` to `nvim` binary.
    vimAlias = true;
    viAlias = true;
  };
}
