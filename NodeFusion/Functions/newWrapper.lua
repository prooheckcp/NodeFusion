--[[
    A simple wrapper for the New function from Fusion
]]
local Fusion = require(script.Parent.Parent.Vendor.Fusion)

local New = Fusion.New

local function newWrapper(className: string, props)
    props = props or {}

    return function (properties)
        for index, value in pairs(props) do
            if index == "props" then
                continue
            end

            properties[index] = value
        end

        return New(className)(properties)
    end
end

return newWrapper