local M = {}

-- Taken and modified from
-- https://github.com/nvim-tree/nvim-tree.lua/blob/master/lua/nvim-tree/notify.lua

local config = {
    threshold = vim.log.levels.INFO,
}

local modes = {
    { name = "trace", level = vim.log.levels.TRACE },
    { name = "debug", level = vim.log.levels.DEBUG },
    { name = "info",  level = vim.log.levels.INFO },
    { name = "warn",  level = vim.log.levels.WARN },
    { name = "error", level = vim.log.levels.ERROR },
}

do
    local has_notify, notify = pcall(require, "notify")

    local dispatch = function(level, msg)
        if level < config.threshold then
            return
        end

        vim.schedule(function()
            if has_notify and notify then
                notify(msg, level, { title = "JUnit" })
            else
                vim.notify(vim.inspect(msg), level)
            end
        end)
    end

    for _, x in ipairs(modes) do
        M[x.name] = function(msg)
            return dispatch(x.level, msg)
        end
    end
end

function M.setup(opts)
    opts = opts or {}
    config.threshold = opts.notify.threshold or vim.log.levels.INFO
end

return M
