local Vendor = script.Parent.Parent.Vendor

local Fusion = require(Vendor.Fusion)
local Button = require(Vendor.StudioComponents.Button)
local Dropdown = require(Vendor.StudioComponents.Dropdown)
local ScrollFrame = require(Vendor.StudioComponents.ScrollFrame) 
local TextInput = require(Vendor.StudioComponents.TextInput)

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
        [Children] = {
            TopColor = New "Frame" {
                BackgroundColor3 = nodeColor,
                Size = UDim2.fromScale(1, 0.2),
                LayoutOrder = 1,
                [Children] = {
                    UICorner = New "UICorner" {
                        CornerRadius = UDim.new(0.1),
                    },
                    ColorBottom = New "Frame" {
                        AnchorPoint = Vector2.new(0.5, 0),
                        BackgroundColor3 = nodeColor,
                        Position = UDim2.fromScale(0.5, 0.5),
                        Size = UDim2.fromScale(1, 0.5),
                    },
                    TextInput = TextInput {
                        BackgroundTransparency = 1,
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        Size = UDim2.fromScale(1, 1),
                        Text = "Hello World",
                        PlaceholderText = "Enter Name...",
                        TextXAlignment = Enum.TextXAlignment.Center,
                        Font = Enum.Font.Nunito,
                        TextScaled = true,
                        ZIndex = 2,
                        [OnChange "Text"] = function(newText)
                            print("You've entered:", newText)
                        end,
                        [Children] = {
                            UIPadding = New "UIPadding" {
                                PaddingLeft = UDim.new(0, 5),
                                PaddingRight = UDim.new(0, 5),
                                PaddingBottom = UDim.new(0, 10),
                                PaddingTop = UDim.new(0, 10),
                            },
                            UIStroke = New "UIStroke" {
                                Color = Color3.fromRGB(0, 0, 0),
                                Thickness = 1,
                            }
                        }
                    }
                }
            },
            
            UILayout = New "UIListLayout" {
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 7),
            },

            --[[
            Properties = ScrollFrame {
                Size = UDim2.fromScale(1, 0.5),
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
            ]]

            --[[
            Button {
                Position = UDim2.fromScale(0, 0),
            },                
            ]]


        }
    }
end

return Node