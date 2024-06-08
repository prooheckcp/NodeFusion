local Node = require(script.Parent.Parent.Components.Node)

local function NodeStory(target)
    local instance: Frame = Node {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Parent = target,
        Size = UDim2.fromScale(0.1, 0.2),
        Position = UDim2.fromScale(0.5, 0.5),
    }

    return function ()
        instance:Destroy()
    end
end

return NodeStory