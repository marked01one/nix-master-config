{pkgs, ...}: {
  programs.vscode = {
    enable = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        # Formatting & styling.
        fabiospampinato.vscode-highlight
        mechatroner.rainbow-csv
        shardulm94.trailing-spaces
        pkief.material-icon-theme
        shd101wyy.markdown-preview-enhanced
        zhuangtongfa.material-theme

        # Tools.
        vscodevim.vim
        tyriar.sort-lines

        # Lua.
        keyring.lua
        sumneko.lua

        # Python extensions.
        ms-python.debugpy
        ms-python.python
        ms-python.vscode-pylance
        ms-python.vscode-python-envs

        # Jupyter notebooks.
        ms-toolsai.jupyter
        ms-toolsai.jupyter-keymap
        ms-toolsai.jupyter-renderers
        ms-toolsai.vscode-jupyter-cell-tags
        ms-toolsai.vscode-jupyter-slideshow

        # Rust.
        a5huynh.vscode-ron
        dustypomerleau.rust-syntax
        fill-labs.dependi
        rust-lang.rust-analyzer

        # Go.
        golang.go

        # Other languages suppport.
        davidanson.vscode-markdownlint
        eww-yuck.yuck
        jnoortheen.nix-ide
        kdl-org.kdl-v1
        tamasfe.even-better-toml
      ];

      # VS Code global snippets for `marked01one`.
      globalSnippets = {
        todo = {
          body = [
            "$LINE_COMMENT TODO: $0"
          ];
          description = "Insert a TODO remark.";
          prefix = ["todo"];
        };
      };

      # VS Code keybindings for `marked01one`.
      keybindings = [
        # Copy to clipboard with "Ctrl+C".
        {
          key = "ctrl+c";
          command = "editor.action.clipboardCopyAction";
          when = "textInputFocus";
        }
      ];

      # Default user settings.
      userSettings = {};
    };
  };

  # Default profile for primary user `marked01one`.
  profiles.marked01one = {};
}
