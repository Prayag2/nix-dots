{ config, pkgs, ... }: {
  programs.vscode = {
    enable = true;
    profiles.default.userSettings = {
      "editor.fontFamily" = "'${config.myFont.font.name}', 'monospace', monospace";
      "editor.fontSize" = 18*config.myFont.font.size_multiplier;
      "vim.useSystemClipboard" = true;
      "workbench.startupEditor" = "none";
      # "workbench.colorTheme" = "vs-wal";
      # "workbench.preferredDarkColorTheme" = "vs-wal";
    };
    profiles.default.extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      ms-vsliveshare.vsliveshare
      github.copilot
      github.copilot-chat
      ms-python.python
      ms-python.debugpy
      esbenp.prettier-vscode
      bbenoist.nix
    ];
  };
  home.file = {
    ".config/wal/templates/vs-wal-color-theme.json".source = ./theme/template.json;
    ".vscode/extensions/vscode-wal/package.json".source = ./theme/package.json;
    ".vscode/argv.json".source = ./argv.json;
  };
}
