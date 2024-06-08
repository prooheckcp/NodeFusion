local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Vendor = script.Parent.Parent.Vendor

local Fusion = require(Vendor.Fusion)
--[[
local Button = require(Vendor.StudioComponents.Button)

local ScrollFrame = require(Vendor.StudioComponents.ScrollFrame) 
local TextInput = require(Vendor.StudioComponents.TextInput)
local Dropdown = require(Vendor.StudioComponents.Dropdown)
]]

local Top = require(script.Top)
local PropertyFrame = require(script.PropertyFrame)
local Property = require(script.Parent.Parent.Classes.Property)
local PropertyType = require(script.Parent.Parent.Enums.PropertyType)
local Settings = require(script.Parent.Settings)
local Gradient = require(script.Parent.Decoration.Gradient)
local newWrapper = require(script.Parent.Parent.Functions.newWrapper)

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
local function Node(properties)
    local props = properties.props or {}
    local nodeName = props.NodeName or Value("Node")
    local nodeColor = props.NodeColor or Value(Color3.fromRGB(221, 62, 62))
    local scale = props.Scale or Value(1)
    local nodeProperties = Value({
        Property.new("Name", PropertyType.String, "Name"),
        Property.new("Color", PropertyType.Color3, Color3.fromRGB(255, 255, 255)),
    })

    return newWrapper("Frame", properties){
        AnchorPoint = Vector2.new(0, 0),
        Parent = props.Parent,
        Name = "Node",
        BackgroundColor3 = Settings.SecondColor,
        BackgroundTransparency = 0,
        Size = UDim2.fromScale(0, 0),
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
            Properties = ForValues(nodeProperties, function()
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