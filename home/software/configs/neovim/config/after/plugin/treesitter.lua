require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  -- ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  sync_install = false,
  auto_install = false,

  highlight = {
    enable = true,

    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    additional_vim_regex_highlighting = false,
  },
}
