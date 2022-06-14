-- Automatically install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end
-- Auto-Reload nvim plugins.lua
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return require("packer").startup(function()
    --Common Libraries
    use "nvim-lua/plenary.nvim"

    -- Core Plugins
    use "kyazdani42/nvim-tree.lua"
    use "folke/which-key.nvim"
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use "nvim-telescope/telescope.nvim"
end)
