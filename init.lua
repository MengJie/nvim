MY_MODULES = {
  'plugins',
  'opts',
  'setup',
  'mappings',
  'autocmds',
  'stl',
}

function load_my_modules()
  for _, module in ipairs(MY_MODULES) do
    local ok, err = pcall(require, module)
    if not ok then
      error(err)
    end
  end
end

function unload_my_modules()
  for _, module in ipairs(MY_MODULES) do
    local prefix = module .. "."
    for key, _ in pairs(package.loaded) do
      if key == module or key:sub(1, #prefix) == prefix then
        package.loaded[key] = nil
        -- print("unload "..key)
      end
    end
  end
end

function reload_my_modules()
  local vimp = require 'vimp'
  vimp.unmap_all()
  unload_my_modules()

  -- save all
  vim.cmd('silent wa')

  -- 设置好 reload 的快捷键，即使重新加载失败了，
  -- 这个快捷键也不会丢
  vimp.bind({'override'}, '<leader>r', function()
    reload_my_modules()
  end)

  dofile(vim.fn.stdpath('config') .. '/init.lua')
  print("Configuration Reloaded!")
end

load_my_modules()

vim.cmd "color sonokai"

