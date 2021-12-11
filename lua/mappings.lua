local vp = require 'vimp'

-- reload my configuration
vp.bind({'override'}, '<leader>r', function()
  reload_my_modules()
end)

-- nvim tree
vp.nnoremap('<C-e>', ':NvimTreeToggle<CR>')

-- nvim telescope
vp.nnoremap('<leader>pf', function() require 'telescope.builtin'.find_files() end)
vp.nnoremap('<C-p>',      function() require 'telescope.builtin'.find_files() end)
vp.nnoremap('<leader>ss', function() require 'telescope.builtin'.live_grep() end)

