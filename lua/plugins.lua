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
    use 'wbthomason/packer.nvim'

    use 'svermeulen/vimpeccable'

    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons',
      }
    }

    if packer_bootstrap then
      require('packer').sync()
    end
  end
)

