local tp = require "tablepath"

local data = {
  hello = {
    world = "!"
  },
  bool = true
}

assert(tp(data).x() == nil)
assert(tp(data).x.y() == nil)
assert(type(tp(data).hello()) == "table")
assert(tp(data).hello.world() == "!")
assert(tp(data).hello.world.x() == nil)
assert(tp(data).hello.world.x.y() == nil)
assert(tp(data).bool.x.y.z() == nil)
assert(tp(data).bool() == true)

print("All ok")
