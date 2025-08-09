-- Improved syntax highlighting

-- Default settings
require'nvim-treesitter'.setup {
  -- Directory to install parsers and queries to
  install_dir = vim.fn.stdpath('data') .. '/site'
}

-- No-op if parsers are already installed
require('nvim-treesitter').install {'lua', 'rust', 'c', 'cpp', 'python', 'markdown_inline'}

-- Enable treesitter highlighting for a filetype
-- See: https://github.com/nvim-treesitter/nvim-treesitter/blob/main/README.md

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})
