-- from reddit (https://www.reddit.com/r/neovim/comments/1ct2w2h/lua_adaptation_of_vimcool_auto_nohlsearch/)
-- executes :nohl after a search AND after the cursor moves
vim.api.nvim_create_autocmd("CursorMoved", {
	group = vim.api.nvim_create_augroup("auto-hlsearch", { clear = true }),
	callback = function()
		if vim.v.hlsearch == 1 and vim.fn.searchcount().exact_match == 0 then
			vim.schedule(function()
				vim.cmd.nohlsearch()
			end)
		end
	end,
})

-- executes gv after moving visual line selection with < or >
-- TODO
