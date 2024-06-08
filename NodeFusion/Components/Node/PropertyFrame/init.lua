local NodeFusion = script.Parent.Parent.Parent

local Fusion = require(NodeFusion.Vendor.Fusion)
local Settings = require(NodeFusion.Components.Settings)
local TextInput = require(NodeFusion.Components.Templates.TextInput)
local Text = require(NodeFusion.Components.Templates.Text)
local PropertyType = require(NodeFusion.Enums.PropertyType)
local Property = require(NodeFusion.Classes.Property)

type Property = Property.Property
--local TextInput = require(NodeFusion.Vendor.StudioComponents.TextInput)

local PROPERTY_INPUT = {
    [PropertyType.String] = require(script.String),
}

local New = Fusion.New
local Children = Fusion.Children
local Value = Fusion.Value
local Computed = Fusion.Computed

--[[
    - props
        Scale: Value<number>
        Property: Value<Property>
]]
local function PropertyFrame(props)
    local scale = props.Scale or Value(1)
    local property: Property = props.Property or Value(Property.new("Name", PropertyType.String, "Name"))

    if not PROPERTY_INPUT[property.PropertyType] then
        --return
    end

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

return PropertyFrame