{config, pkgs, ...}: {
  programs.vscode = {
    userSettings = {
      "editor.fontFamily" = "'JetBrains Mono', 'monospace', monospace";
      "editor.fontSize" = 18;
      "vim.useSystemClipboard" = true;
    };
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      equinusocio.vsc-material-theme-icons
      ms-vsliveshare.vsliveshare
      github.copilot
      github.copilot-chat
      ms-python.python
      ms-python.debugpy
      esbenp.prettier-vscode
    ];
  };
  home.file = {
    ".config/wal/templates/colors-vscode-theme.json".source = ./vscode-wal/templates/colors-vscode-theme.json;
    ".vscode/extensions/vscode-wal/package.json".source = ./vscode-wal/package.json;
  };
}
