# Tab shortcuts
vim.keymap.set("n", "<C-t>", ":tabnew<CR>", { noremap = true, desc="Open a new tab" })
vim.keymap.set("n", "<C-w>", ":tabclose<CR>", { noremap = true, desc="Close current tab" })
vim.keymap.set("n", "tk", ":tabnext<CR>", { noremap = true, desc="Move to the next tab" })
vim.keymap.set("n", "tj", ":tabprev<CR>", { noremap = true, desc="Move to the previous tab" })
vim.keymap.set("n", "th", ":tabfirst<CR>", { noremap = true, desc="Move to the first tab" })
vim.keymap.set("n", "tl", ":tablast<CR>", { noremap = true, desc="Move to the last tab" })
vim.keymap.set("n", '<Leader>th', ':tabmove -1<CR>', { noremap = true, desc="Move tab left"})
vim.keymap.set("n", '<Leader>tl', ':tabmove +1<CR>', { noremap = true, desc="Move tab right" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, desc="Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, desc="Move selected lines up" })

-- Fix Home and End inside tmux/nvim
-- Map <Find> to Home
vim.keymap.set("n", "<Find>", "<Home>")
vim.keymap.set("i", "<Find>", "<Home>")

-- Map <Select> to End
vim.keymap.set("n", "<Select>", "<End>")
vim.keymap.set("i", "<Select>", "<End>")

