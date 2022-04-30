local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function mapcmd(key, cmd)
    vim.api.nvim_set_keymap('n', key, ':' .. cmd .. '<cr>', { noremap = true })
end

local function mapcmdsilent(key, cmd)
    vim.api.nvim_set_keymap('n', key, ':' .. cmd .. '<cr>', { noremap = true, silent = true })
end

function CompileRun()
    local filetype = vim.bo.filetype
    if filetype == "go" then
        vim.cmd("!go run %")
    elseif filetype == "python" then
        vim.cmd("!python3 %")
    end

end

vim.g.mapleader = ' '
map("i", "jj", "<ESC>", { silent = true })
map("n", "H", "^")
map("n", "L", "$")
map("", "<leader>h", "<C-w>h")
map("", "<leader>j", "<C-w>j")
map("", "<leader>k", "<C-w>k")
map("", "<leader>l", "<C-w>l")
map("n", "<leader>t", ":set splitright<cr>:vsplit<cr>:term<cr>i")
mapcmdsilent("S", "w<cr>:lua vim.lsp.buf.formatting()")
mapcmd("<up>", "res +5")
mapcmd("<down>", "res -5")
mapcmd("<left>", "vertical resize-5")
mapcmd("<right>", "vertical resize+5")
mapcmd("<leader>v", "sp")
mapcmd("<leader>s", "vs")
mapcmd("<leader>wq", "wq")
mapcmd("<leader>qq", "q!")
mapcmd("zr", ':lua CompileRun()<cr>')

-- 插件map -----------------------------------------------------------
-- nvimtree
mapcmd("<F3>", "NvimTreeToggle")

-- symbols-outline.nvim
mapcmdsilent("<F8>", "SymbolsOutline")

-- telescope
mapcmd("<leader>ff", "Telescope find_files")
mapcmd("<leader>fg", "Telescope live_grep")
-- lsp
mapcmdsilent("K", "lua vim.lsp.buf.hover()")
mapcmd("<leader>rn", "lua vim.lsp.buf.rename()")
mapcmd("<leader>ca", "lua vim.lsp.buf.code_action()")
mapcmd("gd", "lua vim.lsp.buf.definition()")
mapcmd("gD", "lua vim.lsp.buf.declaration()")
mapcmdsilent("[g", "lua vim.diagnostic.goto_prev()")
mapcmdsilent(']g', "lua vim.diagnostic.goto_next()")

-- bufferline
mapcmdsilent("<C-h>", "BufferLineCyclePrev")
mapcmdsilent("<C-l>", "BufferLineCycleNext")
mapcmdsilent("<leader>1", "BufferLineGoToBuffer 1")
mapcmdsilent("<leader>2", "BufferLineGoToBuffer 2")
mapcmdsilent("<leader>3", "BufferLineGoToBuffer 3")
mapcmdsilent("<leader>4", "BufferLineGoToBuffer 4")
mapcmdsilent("<leader>5", "BufferLineGoToBuffer 5")
mapcmdsilent("<leader>6", "BufferLineGoToBuffer 6")
