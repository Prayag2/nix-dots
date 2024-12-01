{ pkgs, ... }: 
let
  pywal16-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "pywal16.nvim";
    version = "2024-11-17";
    src = pkgs.fetchFromGitHub {
      owner = "uZer";
      repo = "pywal16.nvim";
      rev = "446ae689c8e4569b9537cddadb28d6e939658ea5";
      sha256 = "sha256-kOYv2cG9I1nqSemfh6OTCqbRdOuTiu1ywTjoiSwBefg=";
    };
    meta.homepage = "https://github.com/uZer/pywal16.nvim";
  };
in
{
  home.packages = with pkgs; [
    ripgrep

    # lsp servers
    pyright
    python312Packages.python-lsp-server
    nodePackages.bash-language-server
    nodePackages.typescript-language-server
    clang-tools
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
        telescope-nvim
        nvim-treesitter.withAllGrammars
        pywal16-nvim
        indent-blankline-nvim
        autoclose-nvim
        nvim-highlight-colors
      ];
    };
  };
  xdg.configFile.nvim.source = ./config;
  home.file.".vsnip/".source = ./snippets;
}
