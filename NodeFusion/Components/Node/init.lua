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

    return New "Frame" {
        Parent = props.Parent,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 1),
        AutomaticSize = Enum.AutomaticSize.Y,
        ClipsDescendants = false,
        [Children] = {
            Top {
                NodeColor = nodeColor,
            },
            
            New "UIListLayout" {
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 7),
            },

            ScrollFrame {
                Size = UDim2.fromScale(1, 0.5),
                ClipsDescendants = false,
                LayoutOrder = 2,
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