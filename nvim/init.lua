-- Add vim commands
require('./options') -- Import options.lua file -> has vim commands

-- Add custom keybinds (not including plugin stuff)
require('./keymaps') -- Import keymapping file -> custom keybinds


-- Add plugins
require('./plugins/plugins') -- Initial plugin file (also has plugins w/o own file)

require('./plugins/colorscheme') -- Custom colorscheme

require('./plugins/lsp') -- LSPs

require('./plugins/auto_complete') -- Auto completion
