local Vendor = script.Parent.Parent.Vendor

local Fusion = require(Vendor.Fusion)
--[[
local Button = require(Vendor.StudioComponents.Button)

local ScrollFrame = require(Vendor.StudioComponents.ScrollFrame) 
local TextInput = require(Vendor.StudioComponents.TextInput)    
]]
local Dropdown = require(Vendor.StudioComponents.Dropdown)
local Top = require(script.Top)
local PropertyFrame = require(script.PropertyFrame)
local Property = require(script.Parent.Parent.Classes.Property)
local PropertyType = require(script.Parent.Parent.Enums.PropertyType)
local Settings = require(script.Parent.Settings)
local Gradient = require(script.Parent.Decoration.Gradient)

local New = Fusion.New 
local Children = Fusion.Children
local Value = Fusion.Value
local OnChange = Fusion.OnChange
local ForValues = Fusion.ForValues

--[[
    - props
        - NodeColor: Value<Color3>
        - NodeName: Value<string>
        - Scale: Value<number>
]]
local function Node(props)
    local nodeName = props.NodeName or Value("Node")
    local nodeColor = props.NodeColor or Value(Color3.fromRGB(161, 161, 161))
    local scale = props.Scale or Value(1)
    local properties = Value({
        Property.new("Name", PropertyType.String, "Name"),
        Property.new("Color", PropertyType.Color3, Color3.fromRGB(255, 255, 255)),
    })

    return New "Frame" {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Parent = props.Parent,
        Name = "Node",
        BackgroundColor3 = Settings.SecondColor,
        BackgroundTransparency = 0,
        Size = UDim2.fromScale(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        AutomaticSize = Enum.AutomaticSize.XY,
        ClipsDescendants = false,
        [Children] = {
            TopBar = Top {
                NodeColor = nodeColor,
                NodeName = nodeName,
                LayoutOrder = 1,
                Scale = scale,
            },
            
            Gradient = Gradient {},
            UICorner = New "UICorner" {
                CornerRadius = UDim.new(0, 10),
            },
            Properties = ForValues(properties, function()
                return PropertyFrame {
                    Scaled = scale,
                }
            end, Fusion.cleanup),

            UIListLayout = New "UIListLayout" {
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 0),
            },
        }
    }
end

return Node