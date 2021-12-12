local vp = require 'vimp'

local override_nmap = function(lhs)
  -- relaod 时，由于重新 map 的 key 是由 vimp 设置上去的
  -- 所以此时已经被删除了，所以这里要使用 pcall
  -- 否则会报删除不存在 mapping
  pcall(vim.api.nvim_del_keymap, 'n', lhs)
end

-- override editor default keymap

-- n  <C-L>       * <Cmd>nohlsearch|diffupdate<CR><C-L>
override_nmap('<C-l>')

-- reload my configuration
vp.bind({'override'}, '<leader>r', function()
  reload_my_modules()
end)

-- map ; to :
vp.nnoremap(';', ':')
vp.inoremap('jj', '<ESC>')

-- leader q
vp.nnoremap('<leader>q',  ':q<CR>')
vp.nnoremap('<leader>fs', ':w<CR>')

-- hop
vp.nnoremap('<leader>w', ':HopWord<CR>')

-- nvim tree
vp.nnoremap('<C-e>', ':NvimTreeToggle<CR>')

-- nvim telescope
vp.nnoremap('<leader>pf', function() require 'telescope.builtin'.find_files() end)
vp.nnoremap('<C-p>',      function() require 'telescope.builtin'.find_files() end)
vp.nnoremap('<leader>ss', function() require 'telescope.builtin'.live_grep() end)

vp.nnoremap('<leader><leader>', function() require 'telescope.builtin'.commands() end)

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

-- LSP
vp.nnoremap({'silent'}, 'gd',    ':lua vim.lsp.buf.definition()<CR>')
vp.nnoremap({'silent'}, 'gD',    ':lua vim.lsp.buf.declaration()<CR>')
vp.nnoremap({'silent'}, 'gr',    ':lua vim.lsp.buf.references()<CR>')
vp.nnoremap({'silent'}, 'gi',    ':lua vim.lsp.buf.implementation()<CR>')
vp.nnoremap({'silent'}, 'K',     ':lua vim.lsp.buf.hover()<CR>')
vp.nnoremap({'silent'}, '<C-i>', ':lua vim.lsp.buf.signature_help()<CR>')
vp.nnoremap({'silent'}, 'dj',    ':lua vim.lsp.diagnostic.goto_prev()<CR>')
vp.nnoremap({'silent'}, 'dk',    ':lua vim.lsp.diagnostic.goto_next()<CR>')

