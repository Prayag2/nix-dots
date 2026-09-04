{ pkgs, ... }: 
{
  home.packages = with pkgs; [
    ripgrep

    # lsp servers
    pyright
    python312Packages.python-lsp-server
    clang-tools
    nil

    # for plantuml-previewer-vim
    plantuml
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
        telescope-nvim
        nvim-treesitter.withAllGrammars
        indent-blankline-nvim
        autoclose-nvim
        nvim-highlight-colors
        open-browser-vim
        plantuml-previewer-vim
        codecompanion-nvim
        nvim-web-devicons
      ];
    };
  };

  xdg.configFile.nvim.source = ./config;
  home.file.".vsnip/".source = ./snippets;
}
