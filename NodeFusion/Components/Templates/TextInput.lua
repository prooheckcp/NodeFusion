local NodeFusion = script.Parent.Parent.Parent

local TextInput = require(NodeFusion.Vendor.StudioComponents.TextInput)
local newWrapper = require(NodeFusion.Functions.newWrapper)
local Fusion = require(NodeFusion.Vendor.Fusion)

local Children = Fusion.Children
local OnChange = Fusion.OnChange
local Value = Fusion.Value
local OnEvent = Fusion.OnEvent
local Computed = Fusion.Computed

--[[
    - props
        - HideBackground: boolean
]]
local function TextInputComponent(properties)
    local test = Value("uwu")
    local isFocused = Value(false)
    return newWrapper("Frame", properties){
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        Size = UDim2.new(0, 50, 0.65, 0),
        AutomaticSize = Enum.AutomaticSize.X,
        Position = UDim2.fromScale(0, 0.5),
        [Children] = {
            TextInput {
                LayoutOrder = 1,
                BackgroundTransparency = Computed(function()
                    return isFocused:get() and 0 or 0.9
                end),
                TextScaled = true,
                TextXAlignment = Enum.TextXAlignment.Left,
                AutomaticSize = Enum.AutomaticSize.X,
                Size = UDim2.fromScale(1, 1),
                Text = test,
                PlaceholderText = "Insert Text Here...",
                [OnChange "Text"] = function(newText: string)

                end,
                [OnEvent "Focused"] = function()
                    isFocused:set(true)
                end,
                [OnEvent "FocusLost"] = function()
                    isFocused:set(false)
                end                
            }
        }
    }
end

return TextInputComponent