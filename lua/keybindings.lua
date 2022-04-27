local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
local function mapcmd(key, cmd)
	vim.api.nvim_set_keymap('n', key, ':'..cmd..'<cr>', {noremap=true})
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
map("i","jj","<ESC>",{silent = true })
map("n","H","^")
map("n","L","$")
map("","<leader>h","<C-w>h")
map("","<leader>j","<C-w>j")
map("","<leader>k","<C-w>k")
map("","<leader>l","<C-w>l")
map("n","<leader>t",":set splitright<cr>:vsplit<cr>:term<cr>i")
mapcmd("S","w")
mapcmd("<up>","res +5")
mapcmd("<down>","res -5")
mapcmd("<left>","vertical resize-5")
mapcmd("<right>","vertical resize+5")
mapcmd("<leader>v","sp")
mapcmd("<leader>s","vs")
mapcmd("<leader>wq","wq")
mapcmd("<leader>q","q")
mapcmd("<leader>Q","q!")
mapcmd("zr", ':lua CompileRun()<cr>')


-- 插件map
-- nvimtree
mapcmd("<F3>","NvimTreeToggle")

-- bufferline
mapcmd("<C-h>","BufferLineCyclePrev")
mapcmd("<C-l>","BufferLineCycleNext")
map("n", "<leader>1",":BufferLineGoToBuffer 1<CR>",{silent = true})
map("n", "<leader>2",":BufferLineGoToBuffer 2<CR>",{silent = true})
map("n", "<leader>3",":BufferLineGoToBuffer 3<CR>",{silent = true})
map("n", "<leader>4",":BufferLineGoToBuffer 4<CR>",{silent = true})
map("n", "<leader>5",":BufferLineGoToBuffer 5<CR>",{silent = true})
map("n", "<leader>6",":BufferLineGoToBuffer 6<CR>",{silent = true})
-- telescope
mapcmd("<leader>ff", "Telescope find_files")
mapcmd("<leader>fg", "Telescope live_grep")
