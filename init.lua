MY_MODULES = {
  'plugins',
  'opts',
  'setup',
  'mappings',
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
      end
    end
  end
end

function reload_my_modules()
  local vimp = require 'vimp'
  vimp.unmap_all()
  unload_my_modules()
  vim.cmd('silent wa') -- save all
  dofile(vim.fn.stdpath('config') .. '/init.lua')
  print("Configuration Reloaded!")
end

load_my_modules()

