{config, pkgs, ...}: {
  programs.vscode = {
    userSettings = {
      "editor.fontFamily" = "'JetBrains Mono', 'monospace', monospace";
      "editor.fontSize" = 18;
      "vim.useSystemClipboard" = true;
      "workbench.colorTheme" = "vs-wal";
      "workbench.preferredDarkColorTheme" = "vs-wal";
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
    ".config/wal/templates/vs-wal-color-theme.json".source = ./theme/template.json;
    ".vscode/extensions/vscode-wal/package.json".source = ./theme/package.json;
  };
}
