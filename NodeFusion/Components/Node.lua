local Vendor = script.Parent.Parent.Vendor

local Fusion = require(Vendor.Fusion)
local Button = require(Vendor.StudioComponents.Button)
local Dropdown = require(Vendor.StudioComponents.Dropdown)
local ScrollFrame = require(Vendor.StudioComponents.ScrollFrame)

local New = Fusion.New 
local Children = Fusion.Children
local Value = Fusion.Value

local function Node(props)
    return New "Frame" {
        Parent = props.Parent,
        BackgroundColor3 = Color3.fromRGB(255, 0, 0),
        BackgroundTransparency = 0.5,
        Size = UDim2.fromScale(1, 1),
        [Children] = {
            ScrollFrame {
                [Children] = {
                    UILayout = New "UIListLayout" {
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        Padding = UDim.new(0, 7),
                    },
    
                    UIPadding = New "UIPadding" {
                        PaddingLeft = UDim.new(0, 5),
                        PaddingRight = UDim.new(0, 5),
                        PaddingBottom = UDim.new(0, 10),
                        PaddingTop = UDim.new(0, 10),
                    },

                    DropDown = Dropdown {
                        Value = Value("Custom"),
                        Options = {"Custom", "Extra", "Test", "Too", "Long"},
                        OnSelected = function(newItem)
                            print("You've selected:", newItem)
                        end,
                    }                    
                }
            }
            --[[
            Button {
                Position = UDim2.fromScale(0, 0),
            },                
            ]]


        }
    }
end

return Node