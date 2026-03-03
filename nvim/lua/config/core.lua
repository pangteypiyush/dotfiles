vim.o.mouse      = "a"
vim.o.laststatus = 2
vim.o.encoding   = "utf-8"

vim.o.colorcolumn   = "80"
vim.o.termguicolors = true

vim.o.tabstop    = 4
vim.o.shiftwidth = 4
vim.o.sts        = 4
vim.o.smarttab   = true
vim.o.autoindent = true

vim.o.showmatch  = true
vim.o.splitbelow = true
vim.o.showcmd    = true
vim.o.ruler      = true
vim.o.cursorline = true

vim.o.incsearch  = true
vim.o.hlsearch   = true
vim.o.ignorecase = true
vim.o.smartcase  = true

vim.g.noswapfile    = true
vim.g.nobackup      = true
vim.g.nowritebackup = true
vim.g.autoread      = true

-- allow buffer change even if changes were made
vim.o.hidden = true

vim.o.completeopt = "longest,menuone,preview,noselect"
vim.g.syntax      = "enable"

-- vim.g.filetype_indent_on = true
-- vim.g.filetype_plugin_on = true

vim.g.foldcolumn = "0"
vim.g.foldmethod = "syntax"
vim.g.foldenable = false

vim.g.netrw_liststyle    = 3
vim.g.netrw_banner       = 0
vim.g.netrw_hide         = 1
vim.g.netrw_browse_split = 3
vim.g.netrw_winsize      = 20

-- hybrid line numbering
vim.o.nu        = true
local rnutoggle = vim.api.nvim_create_augroup("rnutoggle", {})
vim.api.nvim_create_autocmd(
    { "BufEnter", "FocusGained", "InsertLeave" },
    {
        group = rnutoggle,
        callback = function()
            vim.o.rnu = true
        end,
    }
)
vim.api.nvim_create_autocmd(
    { "BufLeave", "FocusLost", "InsertEnter" },
    {
        group = rnutoggle,
        callback = function()
            vim.o.rnu = false
        end,
    }
)

vim.keymap.set('n', '<leader>cl', ':let @/=""<cr>', { desc = "clear last search", silent = true })

-- buffer navigation
vim.keymap.set('n', '<leader>bn', ':bnext<cr>')
vim.keymap.set('n', '<leader>bp', ':bprev<cr>')

-- tab navigation
vim.keymap.set('n', '<leader>tc', ':tabnew<cr>')
vim.keymap.set('n', '<leader>td', ':tabclose<cr>')
vim.keymap.set('n', '<leader>tn', ':tabnext<cr>')
vim.keymap.set('n', '<leader>tp', ':tabprev<cr>')

-- render whitespaces
vim.o.list = true
vim.opt.listchars = {
  leadmultispace = "\\u00b7",
  tab = "\\u2192 ",
  trail = "\\u00b7"
}
