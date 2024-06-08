local NodeFusion = script.Parent.Parent.Parent

local TextInput = require(NodeFusion.Components.Templates.TextInput)
local Fusion = require(NodeFusion.Vendor.Fusion)
local Gradient = require(script.Parent.Parent.Decoration.Gradient)
local Settings = require(script.Parent.Parent.Settings)
local RoundedFrame = require(NodeFusion.Components.Templates.RoundedFrame)

local New = Fusion.New
local Children = Fusion.Children
local Value = Fusion.Value
local OnChange = Fusion.OnChange
local Computed = Fusion.Computed

--[[
    - props
        NodeColor: Value<Color3>
        Scale: Value<number>
]]
local function Top(props)
    local nodeColor = props.NodeColor or Value(Color3.fromRGB(164, 76, 76))
    local scale = props.Scale or Value(1)
    local nodeName = props.NodeName or Value("")

    return RoundedFrame {
        Size = Computed(function()
            return UDim2.new(1, 0, 0, 25 * scale:get())
        end),
    }
    
    --[[
    New "CanvasGroup" {
        BackgroundColor3 = nodeColor,
        Size = Computed(function()
            return UDim2.new(1, 0, 0, 25 * scale:get())
        end),
        LayoutOrder = 1,
        Name = "Header",
        AutomaticSize = Enum.AutomaticSize.X,
        [Children] = {
            Gradient = Gradient(),
        }
    }    
    ]]

end

return Top