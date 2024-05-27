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

local New = Fusion.New 
local Children = Fusion.Children
local Value = Fusion.Value
local OnChange = Fusion.OnChange
local ForValues = Fusion.ForValues

local function Node(props)
    local nodeColor = Value(Color3.fromRGB(221, 62, 62))
    local properties = Value({
        Property.new(PropertyType.String, "Hello World"),
    })

    return New "Frame" {
        AnchorPoint = Vector2.new(0, 0),
        Parent = props.Parent,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0,
        Size = UDim2.fromScale(1, 1),
        AutomaticSize = Enum.AutomaticSize.X,
        ClipsDescendants = false,
        [Children] = {
            TopBar = Top {
                NodeColor = nodeColor,
                LayoutOrder = 1,
            },
            
            Properties = ForValues(properties, function()
                local instances = {}

                for _ in properties:get() do
                    instances[#instances+1] = PropertyFrame {}
                end

                return instances
            end),

        
            DropDown = Dropdown {
                LayoutOrder = 2,
                Value = Value("Custom"),
                Options = {"Custom", "Extra", "Test", "Too", "Long"},
                Size = UDim2.fromOffset(50, 50),
                OnSelected = function(newItem)
                    print("You've selected:", newItem)
                end,
            },                
    

            UIListLayout = New "UIListLayout" {
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 0),
            },
        }
    }
end

return Node