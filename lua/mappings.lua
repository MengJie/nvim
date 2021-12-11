local vp = require 'vimp'

local override_nmap = function(lhs)
  -- relaod 时，由于重新 map 的 key 是由 vimp 设置上去的
  -- 所以此时已经被删除了，所以这里要使用 pcall
  -- 否则会报删除不存在 mapping
  pcall(vim.api.nvim_del_keymap, 'n', lhs)
end

-- reset keymap

-- n  <C-L>       * <Cmd>nohlsearch|diffupdate<CR><C-L>
override_nmap('<C-l>')

-- reload my configuration
vp.bind({'override'}, '<leader>r', function()
  reload_my_modules()
end)

-- map ; to :
vp.nnoremap(';', ':')

-- nvim tree
vp.nnoremap('<C-e>', ':NvimTreeToggle<CR>')

-- nvim telescope
vp.nnoremap('<leader>pf', function() require 'telescope.builtin'.find_files() end)
vp.nnoremap('<C-p>',      function() require 'telescope.builtin'.find_files() end)
vp.nnoremap('<leader>ss', function() require 'telescope.builtin'.live_grep() end)

-- window navigation
vp.nnoremap('<C-j>', '<C-w>j')
vp.nnoremap('<C-k>', '<C-w>k')
vp.nnoremap('<C-h>', '<C-w>h')
vp.nnoremap('<C-l>', '<C-w>l')

