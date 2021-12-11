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

-- leader q
vp.nnoremap('<leader>q', ':q<CR>')
vp.nnoremap('<leader>w', ':w<CR>')

-- nvim tree
vp.nnoremap('<C-e>', ':NvimTreeToggle<CR>')

-- nvim telescope
vp.nnoremap('<leader>pf', function() require 'telescope.builtin'.find_files() end)
vp.nnoremap('<C-p>',      function() require 'telescope.builtin'.find_files() end)
vp.nnoremap('<leader>ss', function() require 'telescope.builtin'.live_grep() end)

-- window navigation
vp.nnoremap('<C-j>', function() require 'tmux'.move_bottom() end)
vp.nnoremap('<C-k>', function() require 'tmux'.move_top() end)
vp.nnoremap('<C-h>', function() require 'tmux'.move_left() end)
vp.nnoremap('<C-l>', function() require 'tmux'.move_right() end)

-- window resize
vp.nnoremap('<M-j>', function() require 'tmux'.resize_bottom() end)
vp.nnoremap('<M-k>', function() require 'tmux'.resize_top() end)
vp.nnoremap('<M-h>', function() require 'tmux'.resize_left() end)
vp.nnoremap('<M-l>', function() require 'tmux'.resize_right() end)

