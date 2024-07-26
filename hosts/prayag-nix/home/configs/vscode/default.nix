{config, pkgs, ...}: {
  programs.vscode = {
    userSettings = {
      "editor.fontFamily" = "'JetBrains Mono', 'monospace', monospace";
      "editor.fontSize" = 18;
    };
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      equinusocio.vsc-material-theme-icons
    ];
  };
}
