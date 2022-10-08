require('base')
require('highlights')
require('maps')
require('plugins')

local has = function(x)
  return vim.fn.has(x) == 1
end

local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('macos')
end
if is_win then
  require('windows')
end

-- let g:loaded_ruby_provider = 0
-- let g:loaded_node_provider = 0
-- let g:loaded_perl_provider = 0
