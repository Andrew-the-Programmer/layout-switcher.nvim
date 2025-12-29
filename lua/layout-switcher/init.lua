local M = {}

M.initial_layout = nil
M.last_insert_layout = nil

M.switcher = nil

function M.setup()
	M.switcher = require("layout-switcher.switcher")
	M.switcher.setup()

	M.initial_layout = M.switcher.get_current_layout()

	-- When entering normal mode, switch to US layout
	vim.api.nvim_create_autocmd("ModeChanged", {
		pattern = "i:n",
		callback = function()
			M.last_insert_layout = M.switcher.get_current_layout()
			M.switcher.set_layout(M.initial_layout)
		end,
	})

	-- When entering insert mode, restore previous layout
	vim.api.nvim_create_autocmd("ModeChanged", {
		pattern = "*:i",
		callback = function()
			if M.last_insert_layout ~= nil then
				M.switcher.set_layout(M.last_insert_layout)
			end
		end,
	})
end

return M
