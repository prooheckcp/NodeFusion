local Node = require(script.Parent.Parent.Components.Node)

local function NodeStory(target)
    local instance: Frame = Node {
        Parent = target,
    }

    return function ()
        instance:Destroy()
    end
end

return NodeStory