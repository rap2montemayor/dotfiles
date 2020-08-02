-- load standard vis module, providing parts of the Lua API
require('vis')

vis.events.subscribe(vis.events.INIT, function()
	-- Your global configuration options
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	-- Your per window configuration options e.g.
	-- vis:command('set number')
	vis:command('set tabwidth 4')
	vis:command('set autoindent on')
	vis:command('set number on')
	vis:command('set theme default-256')
	vis:command('set show-tabs on')
end)
