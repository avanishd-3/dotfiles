-- define colorscheme

local colorscheme = 'tokyonight-moon'

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme) -- Check if colorscheme is applied

if not is_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end
