local NodeFusion = script.Parent.Parent.Parent

local TextInput = require(NodeFusion.Components.Templates.TextInput)
local Fusion = require(NodeFusion.Vendor.Fusion)
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
    local nodeColor = props.NodeColor or Value(Color3.fromRGB(255, 254, 254))
    local scale = props.Scale or Value(1)
    local nodeName = props.NodeName or Value("")

    return RoundedFrame {
        Name = "TopFrame",
        Size = Computed(function()
            return UDim2.new(1, 0, 0, 25 * scale:get())
        end),
        props = {
            Color = Color3.fromRGB(188, 99, 15)
        },
        --[[
        props = {
            Color = nodeColor,
        },        
        ]]

        [Children] = {
            TextInput {
                ZIndex = 2,
            }
        }
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