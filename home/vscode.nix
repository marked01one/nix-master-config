{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    profiles.marked01one = {
      extensions = with pkgs.vscode-extensions; [
        fabiospampinato.vscode-highlight
        kdl-org.kdl-v1
        keyring.lua
        ms-python.debugpy
        sumneko.lua
        tamasfe.even-better-toml
        zhuangtongfa.material-theme

        # Python extensions.
        ms-python.python
        ms-python.vscode-pylance
        ms-python.vscode-python-envs
        shd101wyy.markdown-preview-enhanced
        pkief.material-icon-theme
        jnoortheen.nix-ide
        mechatroner.rainbow-csv
        tyriar.sort-lines
        shardulm94.trailing-spaces
        vscodevim.vim
        a5huynh.vscode-ron
        eww-yuck.yuck
        davidanson.vscode-markdownlint
      ];

      # VS Code global snippets for `marked01one`.
      globalSnippets = {
        todo = {
          body = [
            "$LINE_COMMENT TODO: $0"
          ];
          description = "Insert a TODO remark.";
          prefix = ["todo"];
        }
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
    };
  };
}
