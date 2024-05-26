local Fusion = require(script.Parent.Parent.Parent.Vendor.Fusion)

local New = Fusion.New

local function Gradient()
    return New "UIGradient" {
        Color = ColorSequence.new {
            ColorSequenceKeypoint.new(0, Color3.fromRGB(250, 250, 250)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 80, 80)),
        },
        Rotation = 90,
    }
end

return Gradient