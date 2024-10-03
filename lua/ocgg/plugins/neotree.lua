-- return {
-- 	"nvim-neo-tree/neo-tree.nvim",
-- 	branch = "v3.x",
-- 	dependencies = {
-- 		"nvim-lua/plenary.nvim",
-- 		"nvim-tree/nvim-web-devicons",
-- 		"MunifTanjim/nui.nvim",
-- 		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
-- 	},
-- }

return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    require('nvim-tree').setup()
    vim.keymap.set('n', '<leader>n', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle NvimTree' })
  end,
}
