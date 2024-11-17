local cmp = require'cmp'

local borders = {
  "┌",
  "─",
  "┐",
  "│",
  "┘",
  "─",
  "└",
  "│",
}

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered({ border = borders, winblend = 0 }),
    documentation = cmp.config.window.bordered({ winblend = 0 }),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources(
    {{ name = 'nvim_lsp' }, { name = 'vsnip' }},
    {{ name = 'buffer' }})
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
  }, {
    { name = 'buffer' },
  })
)
equire("cmp_git").setup() ]]-- 

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})



-- Configure diagnostics to show underlines only
vim.diagnostic.config({
    virtual_text = false,  -- Disable inline diagnostics
    signs = true,          -- Enable signs in the gutter
    underline = true,      -- Enable underlining of problematic lines
    update_in_insert = false, -- Update diagnostics only in normal mode
    severity_sort = true,  -- Sort diagnostics by severity
})

-- Function to show diagnostics in a floating window on hover
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, { focusable = false, border = "rounded" })
    end,
})
vim.opt.updatetime = 500

-- Configure diagnostics to show underlines only
vim.diagnostic.config({
    virtual_text = false,  -- Disable inline diagnostics
    signs = true,          -- Enable signs in the gutter
    underline = true,      -- Enable underlining of problematic lines
    update_in_insert = false, -- Update diagnostics only in normal mode
    severity_sort = true,  -- Sort diagnostics by severity
})

-- Function to show diagnostics in a floating window on hover
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, { focusable = false, border = "rounded" })
    end,
})
vim.opt.updatetime = 500
-- Configure diagnostics to show underlines only
vim.diagnostic.config({
    virtual_text = false,  -- Disable inline diagnostics
    signs = true,          -- Enable signs in the gutter
    underline = true,      -- Enable underlining of problematic lines
    update_in_insert = false, -- Update diagnostics only in normal mode
    severity_sort = true,  -- Sort diagnostics by severity
})

-- Function to show diagnostics in a floating window on hover
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, { focusable = false, border = "rounded" })
    end,
})
vim.opt.updatetime = 500

-- Configure diagnostics to show underlines only
vim.diagnostic.config({
    virtual_text = false,  -- Disable inline diagnostics
    signs = true,          -- Enable signs in the gutter
    underline = true,      -- Enable underlining of problematic lines
    update_in_insert = false, -- Update diagnostics only in normal mode
    severity_sort = true,  -- Sort diagnostics by severity
})

-- Function to show diagnostics in a floating window on hover
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, { focusable = false, border = borders })
    end,
})
vim.opt.updatetime = 500
