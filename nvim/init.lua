require('geekocean.base')
require('geekocean.highlights')
require('geekocean.maps')
require('geekocean.plugins')

local has = function(x)
  return vim.fn.has(x) == 1
end

local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('geekocean.macos')
end

if is_win then
  require('geekocean.windows')
end
