-- WSL跟系统共享剪贴板
if vim.fn.has('wsl') then
    vim.cmd [[
  augroup Yank
  autocmd!
  autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
  augroup END
  ]]
end
-- vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")
vim.cmd("set shortmess+=c")
vim.opt.clipboard = "unnamedplus"
vim.opt.encoding = "utf-8"
vim.opt.hidden = true
vim.opt.nu = true
-- vim.opt.rnu = true
vim.opt.termguicolors = true
vim.o.termguicolors = true
vim.opt.updatetime = 300
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.ts = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.scrolloff = 5
vim.opt.laststatus = 2
vim.opt.hls = true
vim.o.cursorline = true
