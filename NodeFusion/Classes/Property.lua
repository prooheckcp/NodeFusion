local PropertyType = require(script.Parent.Parent.Enums.PropertyType)

type PropertyType = PropertyType.PropertyType

local Property = {}
Property.__index = Property
Property.PropertyType = PropertyType.String :: PropertyType
Property.Value = nil :: any?

function Property.new(propertyType: PropertyType, startValue: any?) : Property
    if typeof(startValue) ~= propertyType then
        error("Property value must be of type " .. propertyType)
    end

    local self = setmetatable({}, Property)
    self.Value = startValue
    self.PropertyType = propertyType

    return self
end

export type Property = typeof(Property) 

return Property