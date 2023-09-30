local M = {}

---Check if a file exists
---@param file_path string
---@return boolean
function M.file_exists(file_path)
  return vim.loop.fs_stat(file_path) ~= nil
end

---Create a test file meta data name from original file metadata
---@param fmdata table original file metadata
---   * `name` - file name
---   * `apath` - absolute path to file, includes file name
---@return table tfmdata test file metadata
---   * `name` - test file name
---   * `apath` - absolute path to test file, includes file name
function M.get_tfmdata(fmdata)
  -- TODO: add support for unix paths
  local tfname = fmdata.name .. "Test"
  local tffname = tfname .. ".java"
  local tfapath = string.gsub(fmdata.apath, "\\main\\", "\\test\\") .. "\\" .. tffname
  return {
    name = tfname,
    apath = tfapath,
  }
end

return M
