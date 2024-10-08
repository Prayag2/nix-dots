{ pkgs, ... }: {
  home.packages = with pkgs; [
    ripgrep

    # lsp servers
    pyright
    python312Packages.python-lsp-server
    nodePackages.bash-language-server
    nodePackages.typescript-language-server
    clang-tools
    clang
    nil
  ];

  programs = {
    neovim = {
      enable = true;
      vimAlias = true;
      plugins = with pkgs.vimPlugins; [
        vim-vsnip
        nvim-dap
        nvim-dap-ui
        nvim-lspconfig
        nvim-cmp
        nvim-tree-lua
        cmp-nvim-lsp
        cmp-buffer
        cmp-path
        cmp-cmdline
        transparent-nvim
        lualine-nvim
        pywal-nvim
        telescope-nvim
        nvim-treesitter.withAllGrammars
      ];
    };
  };
  xdg.configFile.nvim.source = ./config;
}
