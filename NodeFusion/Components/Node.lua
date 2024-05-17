local Fusion = require(script.Parent.Parent.Vendor.Fusion)

local New = Fusion.New 

local function Node(props)
    return New "Frame" {
        Parent = props.Parent,
        Size = UDim2.fromScale(1, 1),
    }
end

return Node