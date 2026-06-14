-- Use vim ui2
-- Gets rid of the "Press ENTER" annoyance
require('vim._core.ui2').enable({
    enable = true,
    msg = {
        target = 'cmd',
    }
})


-- Add vim commands
require('./options') -- Import options.lua file -> has vim commands

-- Add custom keybinds (not including plugin stuff)
require('./keymaps') -- Import keymapping file -> custom keybinds


-- Add plugins
require('./plugins') -- Initial plugin file (also has plugins w/o own file)
