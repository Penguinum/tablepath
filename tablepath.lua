local tablepath = {
    _VERSION = 'tablepath.lua 0.0.1',
    _URL     = 'http://github.com/Penguinum/tablepath.lua',
    _DESCRIPTION = 'deep lookup for lua tables',
    _LICENSE = [[
      DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
      Version 2, December 2004

Copyright (C) 2020 Alexey Bobrov <penguinum@gmail.com>

Everyone is permitted to copy and distribute verbatim or modified
copies of this license document, and changing it is allowed as long
as the name is changed.

DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

0. You just DO WHAT THE FUCK YOU WANT TO.
    ]]
  }

local tp

local function __index(self, k)
  local value = rawget(self, "data")
  if type(value) ~= "table" then
    return tp(nil)
  else
    return tp(value[k])
  end
end

local function __call(self)
  return rawget(self, "data")
end

function tp(tab)
  local obj = { data = tab }
  return setmetatable(obj, {
    __index = __index,
    __call = __call,
  })
end

return setmetatable(
  tablepath,
  {
    __call = function(_, ...)
      return tp(...)
    end
  }
)
