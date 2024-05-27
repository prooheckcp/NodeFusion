local Vendor = script.Parent.Parent.Parent.Vendor

local Fusion = require(Vendor.Fusion)
local Settings = require(script.Parent.Parent.Settings)

local New = Fusion.New
local Children = Fusion.Children

local function Property(props)
    return New "Frame" {
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Settings.SecondColor,
        LayoutOrder = 2,
        Size = UDim2.fromScale(1, 0.3),
        [Children] = {

        }
    }
end

return Property