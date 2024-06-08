local NodeFusion = script.Parent.Parent.Parent

local newWrapper = require(NodeFusion.Functions.newWrapper)
local Fusion = require(NodeFusion.Vendor.Fusion)
local Gradient = require(NodeFusion.Components.Decoration.Gradient)

local Children = Fusion.Children
local New = Fusion.New
local Computed = Fusion.Computed
local Value = Fusion.Value

--[[
    - props
        Color: Color3 | Value<Color3>
        TopLeft: UDim
        TopRight: UDim
        BottomLeft: UDim
        BottomRight: UDim
]]
local function RoundedFrame(properties)
    local props = properties.props or {}
    local topLeft = props.TopLeft or UDim.new(0, 5)
    local topRight = props.TopRight or UDim.new(0, 5)
    local bottomLeft = props.BottomLeft or UDim.new(0, 0)
    local bottomRight = props.BottomRight or UDim.new(0, 0)
    local color = props.Color or Value(Color3.fromRGB(24, 185, 35))

    local children = properties[Children] or {}
    properties[Children] = nil

    return newWrapper("Frame", properties){
        Name = "RoundedFrame",
        BackgroundTransparency = 1,
        [Children] = {
            children = Computed(function()
                return children
            end, Fusion.cleanup),            
            Background = New("CanvasGroup"){
                BackgroundTransparency = 1,
                GroupColor3 = color,
                Size = UDim2.fromScale(1, 1),
                [Children] = {
                    Gradient = Gradient (),
                    TopLeft = New "Frame" {
                        Size = UDim2.fromScale(0.5, 0.5),
                        Position = UDim2.fromScale(0, 0),
                        [Children] = {
                            New "UICorner" {
                                CornerRadius = topLeft,
                            }
                        }
                    },
                    TopRight = New "Frame" {
                        Size = UDim2.fromScale(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0),
                        [Children] = {
                            New "UICorner" {
                                CornerRadius = topRight,
                            }
                        }
                    },
                    BottomLeft = New "Frame" {
                        Size = UDim2.fromScale(0.5, 0.5),
                        Position = UDim2.fromScale(0, 0.5),
                        [Children] = {
                            New "UICorner" {
                                CornerRadius = bottomLeft,
                            }
                        }
                    },
                    BottomRight = New "Frame" {
                        Size = UDim2.fromScale(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        [Children] = {
                            New "UICorner" {
                                CornerRadius = bottomRight,
                            }
                        }
                    },

                    FillHorizontal = New "Frame" {
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Size = UDim2.fromScale(1, 0.3),
                        Position = UDim2.fromScale(0.5, 0.5),
                    },
                    FillVertical = New "Frame" {
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Size = UDim2.fromScale(0.3, 1),
                        Position = UDim2.fromScale(0.5, 0.5),
                    },
                }
            }
        }
    }
    

end

return RoundedFrame