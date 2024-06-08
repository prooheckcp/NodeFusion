local NodeFusion = script.Parent.Parent.Parent

local Fusion = require(NodeFusion.Vendor.Fusion)
local Settings = require(NodeFusion.Components.Settings)
local TextInput = require(NodeFusion.Components.Templates.TextInput)
local Text = require(NodeFusion.Components.Templates.Text)
--local TextInput = require(NodeFusion.Vendor.StudioComponents.TextInput)

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
            New "UIPadding" {
                PaddingLeft = UDim.new(0, 5),
                PaddingRight = UDim.new(0, 5),
                PaddingTop = UDim.new(0, 5),
                PaddingBottom = UDim.new(0, 5),
            },
            New "UIListLayout" {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0, 5),
                SortOrder = Enum.SortOrder.LayoutOrder,
            },
            TextInput {

            }            
        }
    }
end

return Property