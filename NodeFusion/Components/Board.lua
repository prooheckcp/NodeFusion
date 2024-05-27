local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local Fusion = require(script.Parent.Parent.Vendor.Fusion)
local Node = require(script.Parent.Node)
local newWrapper = require(script.Parent.Parent.Functions.newWrapper)

local MAX_ZOOM: number = 4
local MINIMUM_ZOOM: number = 0.5
local SCROLLING_SPEED: number = 10 -- Bigger == slower
local GRID_SIZE: number = 75
local TILE_COUNT_Y: number = 10
local TILE_COUNT_X: number = 10

local New = Fusion.New
local Children = Fusion.Children
local Value = Fusion.Value
local Cleanup = Fusion.Cleanup
local Computed = Fusion.Computed
local OnEvent = Fusion.OnEvent
local Out = Fusion.Out
local Observer = Fusion.Observer

local function Board(properties)
    local currentZoom = Value(1)
    local offset = Value(Vector2.zero)
    local startHoldOffset = Value(Vector2.zero)
    local startHoldMousePosition = Value(Vector2.zero)
    local mousePosition = Value(Vector2.zero)
    local holdingMouse = Value(false)
    local absoluteSize = Value(Vector2.zero)

    return newWrapper("Frame", properties){
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Name = "Board",
        [Cleanup] = {
            Observer(currentZoom):onChange(function()
                local zoom: number = currentZoom:get()
                local newMousePosition: Vector2 = mousePosition:get()
                print("Current MP", newMousePosition.X, newMousePosition.Y)
                local tileSize: number = GRID_SIZE * currentZoom:get() * TILE_COUNT_X
                local offset_x = newMousePosition.X * (1 - zoom)
                local offset_y = newMousePosition.Y * (1 - zoom)

                offset:set(Vector2.new(
                    offset:get().X + offset_x,
                    offset:get().Y + offset_y
                ))                    
            end),
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
                [Out "AbsoluteSize"] = absoluteSize,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = Computed(function()
                    local currentOffset: Vector2 = offset:get()

                    return UDim2.new(
                        0.5, 
                        currentOffset.X, 
                        0.5, 
                        currentOffset.Y
                    )
                end),
                BackgroundColor3 = Color3.fromRGB(20, 20, 20),
                Image = "rbxassetid://17561832944",
                ScaleType = Enum.ScaleType.Tile,
                TileSize = Computed(function()
                    return UDim2.fromOffset(GRID_SIZE * currentZoom:get(), GRID_SIZE * currentZoom:get())
                end),
                Size = Computed(function()
                    return UDim2.fromOffset(GRID_SIZE * TILE_COUNT_X * currentZoom:get(), GRID_SIZE * TILE_COUNT_Y * currentZoom:get())
                end),
                ZIndex = 1,
                [OnEvent "MouseButton1Down"] = function()
                    startHoldMousePosition:set(mousePosition:get())
                    startHoldOffset:set(offset:get())
                    holdingMouse:set(true)
                end,
                [OnEvent "MouseButton1Up"] = function()
                    holdingMouse:set(false)
                end,
                [OnEvent "MouseLeave"] = function()
                    holdingMouse:set(false)
                end,
                [OnEvent "MouseMoved"] = function(x: number, y: number)
                    mousePosition:set(Vector2.new(x, y))

                    if not holdingMouse:get() then
                        return
                    end

                    local offsetDifference: Vector2 = mousePosition:get() - startHoldMousePosition:get()
                    local newOffset: Vector2 = startHoldOffset:get() + offsetDifference
                    offset:set(Vector2.new(
                        newOffset.X,
                        newOffset.Y
                    ))
                end,
                [Children] = {
                    NodeContainer = New "Frame" {
                        AnchorPoint = Vector2.new(0, 0),
                        Name = "NodeContainer",
                        BackgroundTransparency = 0,
                        Position = Computed(function()
                            if not absoluteSize:get() then
                                return UDim2.fromOffset(0, 0)
                            end

                            local xPosition: number = absoluteSize:get().X/2 - GRID_SIZE/2 * currentZoom:get() 
                            local yPosition: number = absoluteSize:get().Y/2 - GRID_SIZE/2 * currentZoom:get() 

                            return UDim2.fromOffset(xPosition, yPosition)
                        end),
                        Size = Computed(function()
                            return UDim2.fromOffset(GRID_SIZE * currentZoom:get(), GRID_SIZE * currentZoom:get())
                        end),
                        ZIndex = 2,
                        [Children] = {
                            --Node {}
                        }
                    }
                }
            },
        }
    }
end

return Board