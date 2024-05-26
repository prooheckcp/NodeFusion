local Vendor = script.Parent.Parent.Parent.Vendor

local Fusion = require(Vendor.Fusion)
local TextInput = require(Vendor.StudioComponents.TextInput)
local Gradient = require(script.Parent.Parent.Decoration.Gradient)
local Settings = require(script.Parent.Parent.Settings)

local New = Fusion.New
local Children = Fusion.Children
local Value = Fusion.Value
local OnChange = Fusion.OnChange

--[[
    - props
        NodeColor: Color3
]]
local function Top(props)
    local nodeColor = props.NodeColor or Value(Color3.fromRGB(164, 76, 76))

    return New "Frame" {
        BackgroundColor3 = nodeColor,
        Size = UDim2.fromScale(1, 0.2),
        LayoutOrder = 1,
        [Children] = {
            UICorner = New "UICorner" {
                CornerRadius = UDim.new(0.1),
            },
            Gradient = Gradient {},
            TextInput = TextInput {
                BackgroundTransparency = 1,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                Size = UDim2.fromScale(1, 1),
                Text = "Hello World",
                PlaceholderText = "Enter Name...",
                TextXAlignment = Enum.TextXAlignment.Center,
                FontFace = Settings.Font,
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
    }
end

return Top