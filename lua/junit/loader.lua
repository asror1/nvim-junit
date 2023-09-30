---@mod Template loader
local templates = require("junit.templates")

local M = {}

local pkg_sub = "$PACKAGE_DECLARATION"
local test_sub = "$TEST_NAME"

function M.load(name, opts)
  local contents = templates[name]
  -- TODO: replace template variables with values
end

function M.merge_templates(conf)
  return vim.tbl_deep_extend("force", templates, conf or {})
end

---Setup template loader
---@param conf table
function M.setup(conf)
  templates = M.merge_templates(conf.templates)
  M.template_keys = vim.tbl_keys(templates)
end

return M
