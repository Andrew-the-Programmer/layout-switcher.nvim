---@return Switcher

---@class Switcher
---@field get_current_layout fun(): string|number, number () -> layout, status
---@field set_layout fun(layout: string|number): number (layout) -> status
local Switcher = {}

local environments = {
	"hyprland",
}

local function get_first_awaliable_switcher()
	for _, env in ipairs(environments) do
		local switcher = require("layout-switcher.switcher.environments." .. env)
		local success = pcall(switcher.setup)
		if success then
			return switcher
		end
	end
	return nil
end

return get_first_awaliable_switcher()
