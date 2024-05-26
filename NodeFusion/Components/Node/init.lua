local Vendor = script.Parent.Parent.Vendor

local Fusion = require(Vendor.Fusion)
local Button = require(Vendor.StudioComponents.Button)
local Dropdown = require(Vendor.StudioComponents.Dropdown)
local ScrollFrame = require(Vendor.StudioComponents.ScrollFrame) 
local TextInput = require(Vendor.StudioComponents.TextInput)
local Top = require(script.Top)

local New = Fusion.New 
local Children = Fusion.Children
local Value = Fusion.Value
local OnChange = Fusion.OnChange

local function Node(props)
    local nodeColor = Value(Color3.fromRGB(221, 62, 62))
    local properties = Value({
        
    })

    return New "Frame" {
        Parent = props.Parent,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 0),
        AutomaticSize = Enum.AutomaticSize.XY,
        ClipsDescendants = false,
        [Children] = {
            TopBar = Top {
                NodeColor = nodeColor,
                LayoutOrder = 1,
            },
            
            --[[
            DropDown = Dropdown {
                LayoutOrder = 2,
                Value = Value("Custom"),
                Options = {"Custom", "Extra", "Test", "Too", "Long"},
                Size = UDim2.fromOffset(50, 50),
                OnSelected = function(newItem)
                    print("You've selected:", newItem)
                end,
            },                
            ]]

            UIListLayout = New "UIListLayout" {
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 0),
            },
        }
    }
end

return Node