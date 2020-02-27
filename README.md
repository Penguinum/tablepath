# Why?
Because sometimes you need to check some deeply nested field in a table,
but its parent subtables might not exist so you need to write code like this:
```lua
local value = data and data.subtable and data.subtable.subsubtable and data.subtable.subsubtable.value
```
or this:
```lua
local value = (((data or {}).subtable or {}).subsubtable or {}).value
```
Both are painful and still may break. This library is to reduce the pain.
# Usage
```lua
local tp = require "tablepath"

local data = {} -- or table with actual value

local value = tp(data).subtable.subsubtable.value()
-- if it exists it will be the value
-- otherwise it will be nil
```
