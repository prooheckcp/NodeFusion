local Vendor = script.Parent.Parent.Parent.Vendor

local Fusion = require(Vendor.Fusion)
local Settings = require(script.Parent.Parent.Settings)
local Text = require(script.Text)

local New = Fusion.New
local Children = Fusion.Children
local Value = Fusion.Value
local Computed = Fusion.Computed

--[[
    - props
        Scale: Value<number>
]]
local function Property(props)
    local scale = props.Scale or Value(1)

    return New "Frame" {
        Name = "PropertyFrame",
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Settings.SecondColor,
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        Size = Computed(function()
            return UDim2.new(1, 0, 0, 40 * scale:get())
        end),
        [Children] = {
            Text {

            }
        }
    }
end

return Property