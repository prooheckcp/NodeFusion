local PropertyType = {
    String = "string",
    Boolean = "boolean",
    Number = "number",
    UDim = "UDim",
    UDim2 = "UDim2",
    Vector2 = "Vector2",
    Vector3 = "Vector3",
    CFrame = "CFrame",
    Color3 = "Color3",
}

table.freeze(PropertyType)

export type PropertyType = typeof(PropertyType)

return PropertyType 