require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,


   -- additional_vim_regex_highlighting = false,
  },
}
