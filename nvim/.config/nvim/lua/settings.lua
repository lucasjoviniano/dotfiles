local indent, width = 2, 80

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = indent
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = indent
vim.opt.termguicolors = true
vim.opt.textwidth = width
vim.opt.wrap = false

vim.cmd [[colorscheme miramare]]
vim.cmd [[let mapleader=","]]

vim.cmd [[ let g:loaded_gzip         = 1 ]]
vim.cmd [[ let g:loaded_tar          = 1 ]]
vim.cmd [[ let g:loaded_tarPlugin    = 1 ]]
vim.cmd [[ let g:loaded_zipPlugin    = 1 ]]
vim.cmd [[ let g:loaded_2html_plugin = 1 ]]
vim.cmd [[ let g:loaded_netrw        = 1 ]]
vim.cmd [[ let g:loaded_netrwPlugin  = 1 ]]
vim.cmd [[ let g:loaded_matchit      = 1 ]]
vim.cmd [[ let g:loaded_matchparen   = 1 ]]
vim.cmd [[ let g:loaded_spec         = 1 ]]

vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]

vim.keymap.set("n", '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set("n", '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set("n", '<leader>fh', '<cmd>Telescope help_tags<cr>')
vim.keymap.set("n", '<leader>fc', '<cmd>Telescope colorscheme<cr>')

vim.keymap.set('n', '<C-p>', '<cmd>NvimTreeToggle<cr>')

vim.keymap.set('n', "<leader>ft", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=1 <CR> ")
vim.keymap.set('n', "t", ":FloatermToggle myfloat<CR>")
vim.keymap.set('t', "<Esc>", "<C-\\><C-n>:q<CR>")

local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300) 

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error 
-- Show inlay_hints more frequently 
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- Vimspector
vim.cmd([[
nmap <F9> <cmd>call vimspector#Launch()<cr>
nmap <F5> <cmd>call vimspector#StepOver()<cr>
nmap <F8> <cmd>call vimspector#Reset()<cr>
nmap <F11> <cmd>call vimspector#StepOver()<cr>")
nmap <F12> <cmd>call vimspector#StepOut()<cr>")
nmap <F10> <cmd>call vimspector#StepInto()<cr>")
]])
vim.keymap.set('n', "Db", ":call vimspector#ToggleBreakpoint()<cr>")
vim.keymap.set('n', "Dw", ":call vimspector#AddWatch()<cr>")
vim.keymap.set('n', "De", ":call vimspector#Evaluate()<cr>")

vim.cmd([[
let g:vimspector_sidebar_width = 85
let g:vimspector_bottombar_height = 15
let g:vimspector_terminal_maxwidth = 70
]])

vim.keymap.set('n', "<leader>ft", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 fish <CR> ")
vim.keymap.set('n', "t", ":FloatermToggle myfloat<CR>")
vim.keymap.set('t', "<Esc>", "<C-\\><C-n>:q<CR>")
