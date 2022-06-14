local enabled_plugins = {"nvim-tree", "telescope", "treesitter", "which-key"}

for _, i in ipairs(enabled_plugins) do
    require((...) .. i )
end
