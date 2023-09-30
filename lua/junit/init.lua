---JUnit test generator for Neovim
---@mod junit
local utils = require("junit.utils")
local loader = require("junit.loader")
local parser = require("junit.parser")
local notify = require("junit.notify")

local M = {}

---Generates a JUnit test file with template content
---@param args table
function M.generate_test(args)
    if vim.fn.fnamemodify(vim.fn.expand("%"), ":e") ~= "java" then
        notify.error("Fatal: Not a Java file")
        return
    end

    -- current file metadata
    local fmdata = {
        name = vim.fn.fnamemodify(vim.fn.expand("%:t"), ":r"),
        apath = vim.fn.expand("%:p"),
    }

    local ok, pkg = pcall(parser.find_pkg, fmdata.apath)

    if not ok then
        notify.error(pkg)
        return
    end

    if pkg == nil then
        notify.info("Package was not found")
    end

    local tfmdata = utils.get_tfmdata(fmdata)

    if utils.file_exists(tfmdata.apath) then
        vim.ui.select(
            { "Yes", "No" },
            { prompt = "Test file exists, open it?" },
            function(_, idx)
                if idx == 1 then
                    vim.api.nvim_command("e " .. tfmdata.apath)
                end
            end
        )
    else
        local test_buf = io.open(tfmdata.apath, "w")
        if test_buf ~= nil then
            -- TODO: use template loader
            vim.ui.select(
                { "JUnit 5 (Standard)", "Mockito", "Spring" },
                { prompt = "Please choose test template" },
                function(_, idx)
                    local template
                    if idx == 1 then
                        template = templates.standard({
                            pkg = pkg,
                            testClass = filename,
                        })
                    elseif idx == 2 then
                        template = templates.mockito({
                            pkg = pkg,
                            testClass = filename,
                        })
                    elseif idx == 3 then
                        template = templates.spring({
                            pkg = pkg,
                            testClass = filename,
                        })
                    else
                        return
                    end
                    test_buf:write(template)
                    test_buf:close()
                    local timer = vim.loop.new_timer()
                    local timeout = 10 * 1000 -- 10 seconds
                    local start_time = os.time()
                    if timer ~= nil then
                        timer:start(
                            0,
                            100,
                            vim.schedule_wrap(function()
                                if utils.is_file_not_empty(abs_filename) then
                                    timer:stop()
                                    timer:close()
                                    vim.api.nvim_command("vsplit " .. abs_filename)
                                elseif os.time() - start_time >= timeout then
                                    timer:stop()
                                    timer:close()
                                    notify.error(
                                        string.format(
                                            "Test container unable to initialize, timeout duration = %d",
                                            timeout
                                        )
                                    )
                                end
                            end)
                        )
                    end
                end
            )
        else
            notify.error(string.format("Could not create file: %s", filename))
        end
    end
end

return M
