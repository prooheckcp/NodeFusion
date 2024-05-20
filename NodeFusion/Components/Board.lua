local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Fusion = require(script.Parent.Parent.Vendor.Fusion)
local Node = require(script.Parent.Node)
local newWrapper = require(script.Parent.Parent.Functions.newWrapper)

local New = Fusion.New
local Children = Fusion.Children

local function Board(properties)
    return newWrapper("Frame", properties){
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        [Children] = {
            Background = New "ImageLabel" {
                BackgroundColor3 = Color3.fromRGB(20, 20, 20),
                Image = "rbxassetid://17561832944",
                ScaleType = Enum.ScaleType.Tile,
                TileSize = UDim2.fromOffset(50, 50),
                Size = UDim2.fromScale(1, 1),
                ZIndex = 1,
            },
            NodeContainer = New "Frame" {
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundTransparency = 1,
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromOffset(100, 100),
                ZIndex = 2,
                [Children] = {
                    Node {}
                }
            }
        }
    }
end

return Board