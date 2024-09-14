" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Syntax highlighting and code highlighting plugins
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'         " LSP configuration
Plug 'hrsh7th/nvim-cmp'              " Autocompletion plugin
Plug 'hrsh7th/cmp-nvim-lsp'          " LSP source for nvim-cmp
Plug 'hrsh7th/cmp-buffer'            " Buffer source for nvim-cmp
Plug 'hrsh7th/cmp-path'              " Path source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'             " Snippet source for nvim-cmp
Plug 'microsoft/vscode-cpptools'     " C/C++ language server

" Initialize plugin system
call plug#end()

" Enable syntax highlighting
syntax enable

" Enable file type detection
filetype plugin indent on

" Configure Treesitter for better syntax highlighting
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF

" Set up nvim-cmp for autocompletion
lua << EOF
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'vsnip' },
  },
})
EOF

" Set up LSP configuration
lua << EOF
local lspconfig = require('lspconfig')
lspconfig.clangd.setup{}  -- For C/C++ language server
EOF
