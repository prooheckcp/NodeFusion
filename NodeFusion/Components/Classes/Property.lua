local PropertyType = require(script.Parent.Parent.Enums.PropertyType)

type PropertyType = PropertyType.PropertyType

local Property = {}
Property.__index = Property
Property.PropertyType = PropertyType.String :: PropertyType
Property.Value = nil :: any?

function Property.new()
    local self = setmetatable({}, Property)

    return self
end

return Property