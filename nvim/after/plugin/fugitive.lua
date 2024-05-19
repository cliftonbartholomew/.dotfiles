vim.keymap.set("n", "<leader>gg", vim.cmd.Git, { noremap = true, silent = true, desc = "open git status" })
vim.keymap.set("n", "<leader>gc", vim.cmd.GitCommit, { noremap = true, silent = true, desc = "git commit" })
vim.keymap.set("n", "<leader>gp", vim.cmd.GitPush, { noremap = true, silent = true, desc = "git push" })
vim.keymap.set("n", "<leader>gP", vim.cmd.GitPull, { noremap = true, silent = true, desc = "git pull" })
