local M = {}

---@type number
local pc = 1
---@type number
local dc = 1
---@type string
local src = ""
---@type table
local mem = {}
---@type string
local buf = ""

local function jump_loop_start()
  local depth = 0
  pc = pc - 1
  while depth > 0 or src:sub(pc, pc) ~= "[" do
    if src:sub(pc, pc) == "]" then
      depth = depth + 1
    elseif src:sub(pc, pc) == "[" then
      depth = depth - 1
    end

    pc = pc - 1
  end
end

local function jump_loop_end()
  local depth = 0
  pc = pc + 1
  while depth > 0 or src:sub(pc, pc) ~= "]" do
    if src:sub(pc, pc) == "[" then
      depth = depth + 1
    elseif src:sub(pc, pc) == "]" then
      depth = depth - 1
    end

    pc = pc + 1
  end
end

local function step()
  local op = src:sub(pc, pc)

  if op == ">" then
    dc = dc + 1
  elseif op == "<" then
    dc = dc - 1
  elseif op == "+" then
    mem[dc] = mem[dc] + 1
  elseif op == "-" then
    mem[dc] = mem[dc] - 1
  elseif op == "." then
    buf = buf .. string.char(mem[dc])
  elseif op == "[" and mem[dc] == 0 then
    jump_loop_end()
  elseif op == "]" and mem[dc] ~= 0 then
    jump_loop_start()
  end

  pc = pc + 1
end

local function flush() print(buf) end

M.setup = function(s)
  pc = 1
  dc = 1
  src = s
  for _ = 1, 30000 do
    table.insert(mem, 0)
  end
end

M.exec = function()
  while pc ~= #src + 1 do
    step()
  end

  flush()
end

return M
