" init.vim
" Author: Jon Lamar
" Goal: Just enough IDE functionality to do serious python and scala
" development, without too much bloat.

" Outstanding TODOs:
" 1. Look into better code folding settings.
" 3. Work on better ranger integration.
" 5. Goyo should preserve old splits.

" Virtual environment for running required neovim modules
" TODO: Figure out where this belongs.
let g:python3_host_prog = expand('~/.config/nvim/venv/bin/python')

source $HOME/.config/nvim/plugins/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/keybindings.vim
source $HOME/.config/nvim/general/terminal.vim
source $HOME/.config/nvim/filetypes/filetypes.vim

" TODO: Move this lua stuff to a separate file
lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  require('completion')
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- TODO: Move keymap settings to whichkey config.  For some reason it doesn't want to work.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', '<leader>la', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>ld', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<leader>lD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- buf_set_keymap('n', '<leader>lf', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  -- buf_set_keymap('n', '<leader>lF', '<Cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
  buf_set_keymap('n', '<leader>lf', '<Cmd>call Black()<CR>', opts)
  buf_set_keymap('n', '<leader>li', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>lI', '<Cmd>lua vim.lsp.diagnostic.get_all()<CR>', opts)
  buf_set_keymap('n', '<leader>ln', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>lp', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<leader>lr', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>lR', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>lt', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = { "pyright", "tsserver", "metals" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {on_attach=on_attach}
end
EOF

source $HOME/.config/nvim/plugins/settings/vim-which-key.vim " This must be sourced after all bindings.
