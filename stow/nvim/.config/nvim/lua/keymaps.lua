# Tab shortcuts
vim.keymap.set("n", "<C-t>", ":tabnew<CR>")
vim.keymap.set("n", "<C-w>", ":tabclose<CR>")
vim.keymap.set("n", "tk", ":tabnext<CR>")
vim.keymap.set("n", "tj", ":tabprev<CR>")
vim.keymap.set("n", "th", ":tabfirst<CR>")
vim.keymap.set("n", "tl", ":tablast<CR>")

-- Move selected lines down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Move selected lines up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

