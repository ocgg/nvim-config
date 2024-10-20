vim.g.mapleader = " "

local function map(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc or rhs })
end

-- no highlight search
map("n", "<leader><space>", "<CMD>noh<CR>", "No Highlight Search")

-- Exit insert mode
map("i", "jk", "<ESC>")

-- New Windows
map("n", "<leader>v", "<CMD>vsplit<CR>", "Vertical Split")
map("n", "<leader>x", "<CMD>split<CR>", "Horizontal Split")

-- Window Navigation
-- map("n", "<C-h>", "<C-w>h")
-- map("n", "<C-l>", "<C-w>l")
-- map("n", "<C-k>", "<C-w>k")
-- map("n", "<C-j>", "<C-w>j")

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Documentation" })

-- Diagnostic
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

map("n", "<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
map("n", "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

-- for visual line reindent
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Search and Replace
vim.keymap.set(
	{ "n", "v" },
	"<leader>sr",
	require("ocgg.scripts.search_and_replace").replace,
	{ desc = "Search and Replace" }
)
