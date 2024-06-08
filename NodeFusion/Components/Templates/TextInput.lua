local NodeFusion = script.Parent.Parent.Parent

local TextInput = require(NodeFusion.Vendor.StudioComponents.TextInput)
local newWrapper = require(NodeFusion.Functions.newWrapper)
local Fusion = require(NodeFusion.Vendor.Fusion)

local TWEEN_INFO: TweenInfo = TweenInfo.new(0.2)

local Children = Fusion.Children
local OnChange = Fusion.OnChange
local Value = Fusion.Value
local OnEvent = Fusion.OnEvent
local Computed = Fusion.Computed
local Tween = Fusion.Tween
local Observer = Fusion.Observer

--[[
    - props
        - HideBackground: boolean
]]
local function TextInputComponent(properties)
    local test = Value("uwu")
    local isFocused = Value(false)
    local backgroundTransparency = Value(1)
    local backgroundTransparencyTween = Tween(backgroundTransparency, TWEEN_INFO)

    local function backgroundTransparencyChanged()
        backgroundTransparency:set(isFocused:get() and 0 or 1)
    end

    Observer(isFocused):onChange(backgroundTransparencyChanged)
    backgroundTransparencyChanged()
    
    return newWrapper("Frame", properties){
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        Size = UDim2.new(0, 50, 0.65, 0),
        AutomaticSize = Enum.AutomaticSize.X,
        Position = UDim2.fromScale(0, 0.5),
        [Children] = {
            TextInput {
                LayoutOrder = 1,
                BackgroundTransparency = backgroundTransparencyTween,
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