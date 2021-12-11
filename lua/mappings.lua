local vp = require 'vimp'

-- reload my configuration
vp.nnoremap('<leader>r', function()
  reload_my_modules()
end)

vp.nnoremap('<C-e>', ':NvimTreeToggle<CR>')

