local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local Fusion = require(script.Parent.Parent.Vendor.Fusion)
local Node = require(script.Parent.Node)
local newWrapper = require(script.Parent.Parent.Functions.newWrapper)

local MAX_ZOOM: number = 4
local MINIMUM_ZOOM: number = 0.5
local SCROLLING_SPEED: number = 15 -- Bigger == slower
local GRID_SIZE: number = 75
local MAX_Y_SIZE: number = 1000
local MAX_X_SIZE: number = 1000

local New = Fusion.New
local Children = Fusion.Children
local Value = Fusion.Value
local Cleanup = Fusion.Cleanup
local Computed = Fusion.Computed
local OnEvent = Fusion.OnEvent

local function Board(properties)
    local currentZoom = Value(1)
    local offset = Value(Vector2.zero)
    local startHoldOffset = Value(Vector2.zero)
    local startHoldMousePosition = Value(Vector2.zero)
    local mousePosition = Value(Vector2.zero)

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
            Background = New "ImageButton" {
                Name = "BoardBackground",
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(20, 20, 20),
                Image = "rbxassetid://17561832944",
                ScaleType = Enum.ScaleType.Tile,
                TileSize = Computed(function()
                    return UDim2.fromOffset(GRID_SIZE * currentZoom:get(), GRID_SIZE * currentZoom:get())
                end),
                Size = UDim2.fromScale(1, 1),
                ZIndex = 1,
                [OnEvent "MouseButton1Down"] = function()
                    startHoldMousePosition:set(mousePosition:get())
                end,
                [OnEvent "MouseButton1Up"] = function(...)
                    print(...)
                end,
                [OnEvent "MouseMoved"] = function(x: number, y: number)
                    mousePosition:set(Vector2.new(x, y))
                end,
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