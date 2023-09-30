if vim.g.loaded_junit then
	return
end

local save_cpo = vim.o.cpo

vim.o.cpo = vim.o.cpo .. "vim"

--- @class junit
--- @param _ any
--- @param fargs table
vim.api.nvim_create_user_command("JUnitGenerateTest", function(_, fargs) require("junit").generate_test(fargs)
end, {})

vim.o.cpo = save_cpo

vim.g.loaded_junit = 1
