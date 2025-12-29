local M = {}

M.initial_layout = nil
M.last_insert_layout = nil

M.switcher = nil

function M.setup()
	M.switcher = require("layout-switcher.switcher")

	M.initial_layout = M.switcher.get_current_layout()

	-- When exiting insert mode, switch to initial layout
	vim.api.nvim_create_autocmd("ModeChanged", {
		pattern = "i:*",
		callback = function()
			local status
			M.last_insert_layout, status = M.switcher.get_current_layout()
			if status ~= 0 then
				vim.notify("Failed to get current layout", vim.log.levels.WARN)
			end
			if M.initial_layout ~= M.last_insert_layout then
				status = M.switcher.set_layout(M.initial_layout)
				if status ~= 0 then
					vim.notify("Failed to set layout", vim.log.levels.WARN)
				end
			end
		end,
	})

	-- When entering insert mode, switch to last insert layout
	vim.api.nvim_create_autocmd("ModeChanged", {
		pattern = "*:i",
		callback = function()
			if M.last_insert_layout == nil or M.last_insert_layout == M.initial_layout then
				return
			end
			local status = M.switcher.set_layout(M.last_insert_layout)
			if status ~= 0 then
				vim.notify("Failed to set layout", vim.log.levels.WARN)
			end
		end,
	})
end

return M
