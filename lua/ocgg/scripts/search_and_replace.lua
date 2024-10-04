local M = {}

--[[
Prepare search and replace command like this:

    :%s/pattern/[CURSOR]/g

- pattern: the visual/vline selection if any, or the word under the cursor
- CURSOR: the cursor is placed here to type the replacement

Note: Uses the v register to store the visual selection.
]]
function M.search()
	-- get current mode (https://neovim.io/doc/user/builtin.html#mode())
	local mode = vim.api.nvim_get_mode().mode
	-- check if current mode is visual or visual line
	local v_or_V = mode == "v" or mode == "V"

	-- return if current mode is not normal, visual or visual line
	if mode ~= "n" and not v_or_V then
		local msg = "Must be in normal, visual char or visual line mode"
		vim.notify(msg, vim.log.levels.ERROR)
		return
	elseif v_or_V then
		-- save visual selection in register v
		vim.cmd('normal! "vy')

		-- content of register v with escaped newlines & end of line
		REGISTER = vim.fn.getreg("v")
		REGISTER = REGISTER:gsub("\n", "\\n"):gsub("^I", "\\n"):gsub("$", "")
	end

	local pattern = v_or_V and REGISTER or vim.fn.expand("<cword>")
	vim.api.nvim_input("<Esc>:%s/" .. pattern .. "//g<left><left>")
end

return M
