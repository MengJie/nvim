local SETUP_MODULES = {
  'setup.nvim-tree',
  'setup.nvim-treesitter',
  'setup.tmux',
  'setup.hop',
  'setup.cmp',
  'setup.lsp',
}

for _, module in pairs(SETUP_MODULES) do
  local ok, err = pcall(require, module)
  if not ok then
    error(err)
  end
end

