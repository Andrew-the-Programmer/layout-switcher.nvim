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
		error("Failed to get main device")
	end
	output = output:gsub("\n", "")
	return output
end

-- Helper function to get device config option
local function get_device_config_option(option)
	local cmd = ([[
  hyprctl devices -j | jq -r '
      .keyboards[] 
      | select(.name == "%s")
      | .%s'
  ]]):format(M.hyprctl_input_device, option)
	local output = vim.fn.system(cmd)
	local status = vim.v.shell_error
	if status ~= 0 then
		error("Failed to get device config option")
	end
	output = output:gsub("\n", "")
	return output
end

function M.get_current_layout()
	return get_device_config_option("active_layout_index")
end

function M.set_layout(index)
	local cmd = ('hyprctl switchxkblayout "%s" %d'):format(M.hyprctl_input_device, index)
	vim.fn.system(cmd)
	local status = vim.v.shell_error
	if status ~= 0 then
		error("Failed to set layout")
	end
end

function M.setup()
	M.hyprctl_input_device = get_device()
end

return M
