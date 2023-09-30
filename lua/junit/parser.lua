local M = {}

---Find package declaration in java file
---@param fapath string
---@return string | nil package declaration
function M.find_pkg(fapath)
  local file = io.open(fapath, "r")
  if file == nil then
    error("Fatal: File " .. fapath .. " not found")
  end
  local line = file:read("*l") -- read first line
  if line ~= nil and #line ~= 0 and string.match(line, "^package") then
    return line
  end
  file:close()
end

return M
