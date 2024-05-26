local CoreGui = game:GetService("CoreGui")

local Widget = require(script.Vendor.PluginComponents.Widget)
local Toolbar = require(script.Vendor.PluginComponents.Toolbar)
local ToolbarButton = require(script.Vendor.PluginComponents.ToolbarButton)
local Fusion = require(script.Vendor.Fusion)
local Board = require(script.Components.Board)

local Value = Fusion.Value
local OnEvent = Fusion.OnEvent
local Children = Fusion.Children
local OnChange = Fusion.OnChange

local widgetsEnabled = Value(false)
local pluginToolbar = Toolbar {
    Name = "Example Toolbar"
}

local screenGui = Instance.new("ScreenGui")
local b = Board {}
b.Parent = screenGui

local enableButton = ToolbarButton {
    Toolbar = pluginToolbar,

    ClickableWhenViewportHidden = true,
    Name = "Examples",
    ToolTip = "View Example Components",
    Image = "",

    [OnEvent "Click"] = function()
        screenGui.Parent = widgetsEnabled:get() and CoreGui or nil
        widgetsEnabled:set(not widgetsEnabled:get())
    end,
}

--[[
Widget {
    Id = game:GetService("HttpService"):GenerateGUID(),
    Name = "Component Examples",

    InitialDockTo = Enum.InitialDockState.Top,
    InitialEnabled = false,
    ForceInitialEnabled = false,
    FloatingSize = Vector2.new(250, 200),
    MinimumSize = Vector2.new(250, 200),

    Enabled = widgetsEnabled,
    [OnChange "Enabled"] = function(isEnabled)
        widgetsEnabled:set(isEnabled)
    end,
    [Children] = {
        Board {}
    },
}
]]
