---@return Switcher

local M = {}

-- Keyboard device name
M.hyprctl_input_device = nil

local function get_device(option)
	local cmd = ([[
  hyprctl devices -j | jq -r '
      .keyboards[] 
      | select(.main == true)
      | .name'
  ]]):format(M.hyprctl_input_device, option)
	local output = vim.fn.system(cmd)
	local status = vim.v.shell_error
	if status ~= 0 then
		vim.notify("Failed to get main device", vim.log.levels.WARN)
	end
	output = output:gsub("\n", "")
	return output
end

function M.get_current_layout()
	local cmd = ([[
  hyprctl devices -j | jq -r '
      .keyboards[] 
      | select(.name == "%s")
      | .active_layout_index'
  ]]):format(M.hyprctl_input_device)
	local output = vim.fn.system(cmd)
	local status = vim.v.shell_error
	output = output:gsub("\n", "")
	return output, status
end

function M.set_layout(index)
	local cmd = ('hyprctl switchxkblayout "%s" %d'):format(M.hyprctl_input_device, index)
	vim.fn.system(cmd)
	local status = vim.v.shell_error
	return status
end

function M.setup()
	M.hyprctl_input_device = get_device()
end

return M
