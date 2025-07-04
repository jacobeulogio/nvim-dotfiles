return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gs", ":G<CR>", { desc="Git Status" })

        local Eulogio_Fugitive = vim.api.nvim_create_augroup("Eulogio_Fugitive", {})

        local autocmd = vim.api.nvim_create_autocmd
        autocmd("BufWinEnter", {
            group = Eulogio_Fugitive,
            pattern = "*",
            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                vim.keymap.set("n", "<leader>p", function()
                    vim.cmd.Git('push')
                end, { buffer = bufnr, remap = false, desc = "Git push"})

                -- rebase always
                vim.keymap.set("n", "<leader>P", function()
                    vim.cmd.Git({'pull',  '--rebase'})
                end, { buffer = bufnr, remap = false, desc = "Git pull"})

                -- NOTE: It allows me to easily set the branch i am pushing and any tracking
                -- needed if i did not set the branch up correctly
                vim.keymap.set("n", "<leader>b", ":Git push -u origin ", { buffer = bufnr, remap = false, desc = "Git set upstream branch"});
            end,
        })

        -- Diff
        vim.keymap.set("n", "<leader>dp", "<cmd>diffput<CR>")
        vim.keymap.set("n", "<leader>dg", "<cmd>diffget<CR>")
        vim.keymap.set("n", "<leader>dh", "<cmd>diffget //2<CR>")
        vim.keymap.set("n", "<leader>dl", "<cmd>diffget //3<CR>")
    end
}
