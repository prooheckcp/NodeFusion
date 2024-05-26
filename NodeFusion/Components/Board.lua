local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local Fusion = require(script.Parent.Parent.Vendor.Fusion)
local Node = require(script.Parent.Node)
local newWrapper = require(script.Parent.Parent.Functions.newWrapper)

local MAX_ZOOM: number = 4
local MINIMUM_ZOOM: number = 0.5
local SCROLLING_SPEED: number = 15 -- Bigger == slower
local GRID_SIZE: number = 75

local New = Fusion.New
local Children = Fusion.Children
local Value = Fusion.Value
local Cleanup = Fusion.Cleanup
local Computed = Fusion.Computed

local function Board(properties)
    local currentZoom = Value(1)

    return newWrapper("Frame", properties){
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Name = "Board",
        [Cleanup] = {
            UserInputService.InputChanged:Connect(function(input: InputObject)
                if input.UserInputType == Enum.UserInputType.MouseWheel then
                    local delta = input.Position.Z
                    local zoom = currentZoom:get()
                    zoom = math.clamp(zoom + delta/SCROLLING_SPEED, MINIMUM_ZOOM, MAX_ZOOM)
                    currentZoom:set(zoom)
                end
            end),
        },
        [Children] = {
            Background = New "ImageLabel" {
                BackgroundColor3 = Color3.fromRGB(20, 20, 20),
                Image = "rbxassetid://17561832944",
                ScaleType = Enum.ScaleType.Tile,
                TileSize = Computed(function()
                    return UDim2.fromOffset(GRID_SIZE * currentZoom:get(), GRID_SIZE * currentZoom:get())
                end),
                Size = UDim2.fromScale(1, 1),
                ZIndex = 1,
            },
            NodeContainer = New "Frame" {
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundTransparency = 1,
                Position = UDim2.fromScale(0.5, 0.5),
                Size = Computed(function()
                    return UDim2.fromOffset(100 * currentZoom:get(), 100 * currentZoom:get())
                end),
                ZIndex = 2,
                [Children] = {
                    Node {}
                }
            }
        }
    }
end

return Board