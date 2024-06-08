local NodeFusion = script.Parent.Parent.Parent

local TextInput = require(NodeFusion.Vendor.StudioComponents.TextInput)
local newWrapper = require(NodeFusion.Functions.newWrapper)
local Fusion = require(NodeFusion.Vendor.Fusion)

local Children = Fusion.Children
local OnChange = Fusion.OnChange
local Value = Fusion.Value

local function TextInputComponent(properties)
    local test = Value("1")
    return newWrapper("Frame", properties){
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        Size = UDim2.new(0, 50, 0.65, 0),
        AutomaticSize = Enum.AutomaticSize.X,
        Position = UDim2.fromScale(0, 0.5),
        [Children] = {
            TextInput {
                TextScaled = true,
                TextXAlignment = Enum.TextXAlignment.Left,
                AutomaticSize = Enum.AutomaticSize.X,
                Size = UDim2.fromScale(1, 1),
                Text = test,
                PlaceholderText = "Hello",
                [OnChange "Text"] = function(newText: string)
                    if newText == "" then
                        test:set("0")
                    elseif tonumber(newText) == nil then
                        test:set(test:get(), true)
                    else
                        test:set(newText)
                    end
                end
            }
        }
    }
end

return TextInputComponent