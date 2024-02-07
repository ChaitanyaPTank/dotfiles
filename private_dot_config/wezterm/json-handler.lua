local JSON_FILE_HANDLER = {}

local wezterm = require("wezterm")

--- Read the specified file into a Lua table
---@param path string
---@return table
function JSON_FILE_HANDLER.read(path)
  local file = io.open(path, "r")
  if file then
    local contents = file:read("a")
    local json = wezterm.json_parse(contents)
    file:close()
    return json
  end
  return {}
end

--- Write specified contents to a json file for persistent storage
---@param contents table
---@param path string
function JSON_FILE_HANDLER.write(contents, path)
  local file = io.open(path, "w")
  if file then
    local json = wezterm.json_encode(contents)
    file:write(json)
    file:close()
  end
end

return JSON_FILE_HANDLER
