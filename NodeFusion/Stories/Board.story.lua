local Board = require(script.Parent.Parent.Components.Board)

local function BoardStory(target)
    local instance: Frame = Board {
        Parent = target,
    }

    return function ()
        instance:Destroy()
    end
end

return BoardStory