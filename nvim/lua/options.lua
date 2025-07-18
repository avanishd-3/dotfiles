vim.opt.clipboard = 'unnamedplus' -- use system clipboard

-- Tab Behavior
vim.opt.tabstop = 4  -- 4 visual spaces per tab
vim.opt.softtabstop = 4 -- 4 spaces in tab when editing
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.expandtab = true -- have tabs behave as spaces for python

-- UI Stuff
vim.opt.number = true -- set numbered lines

-- Inline warnings and errors
vim.diagnostic.enable = true
vim.diagnostic.config({
    virtual_text = true,
})
