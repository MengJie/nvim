-- packer.nvim bootstrap
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', 
    install_path
  })
end

vim.cmd [[packadd packer.nvim]]

return require 'packer'.startup(
  function()
    -- 包管理
    use 'wbthomason/packer.nvim'
    -- 用于设置key mapping的库
    use 'svermeulen/vimpeccable'
    -- color scheme
    use 'sainnhe/sonokai'
    -- better highlighting
    use 'nvim-treesitter/nvim-treesitter'
    -- nvim tree
    use {
      'kyazdani42/nvim-tree.lua',
      requires = { 'kyazdani42/nvim-web-devicons' }
    }
    -- telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/plenary.nvim' }
    }

    if packer_bootstrap then
      require('packer').sync()
    end
  end
)

