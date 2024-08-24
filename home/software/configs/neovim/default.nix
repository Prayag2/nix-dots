{ config, ... }: {
  programs = {
    neovim = {
      enable = true;
      extraConfig = ''
        set clipboard=unnamedplus
        set tabstop=2
        set shiftwidth=2
        set softtabstop=2
        set expandtab
      '';
      vimAlias = true;
    };
  }
  xdg.configFile.nvim.source = ./config;
}
