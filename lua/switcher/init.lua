---@return Switcher

---@class Switcher
---@field get_current_layout fun(): string|number
---@field set_layout fun(layout: string|number)
local Switcher = {}

M = require("layout-switch.switcher.hyprland")

return M
