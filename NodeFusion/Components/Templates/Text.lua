local NodeFusion = script.Parent.Parent.Parent

local Settings = require(NodeFusion.Components.Settings)
local newWrapper = require(NodeFusion.Functions.newWrapper)

local function Text(properties)
    return newWrapper("TextLabel", properties){
        BackgroundTransparency = 1,
        Text = "Hello World",
        TextScaled = true,
        FontFace = Settings.Font,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.fromScale(1, 1),
    }
end

return Text