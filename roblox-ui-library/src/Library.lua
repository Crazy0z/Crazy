local Library = {}
Library.__index = Library

function Library.new()
    local self = setmetatable({}, Library)
    self.windows = {}
    return self
end

function Library:CreateWindow(properties)
    local Window = require(script.Parent.Components.Window)
    local newWindow = Window.new(properties)
    table.insert(self.windows, newWindow)
    return newWindow
end

function Library:DestroyWindow(window)
    for i, win in ipairs(self.windows) do
        if win == window then
            win:Destroy()
            table.remove(self.windows, i)
            break
        end
    end
end

function Library:CreatePage(window, properties)
    local Page = require(script.Parent.Components.Page)
    return Page.new(window, properties)
end

function Library:CreateSection(page, properties)
    local Section = require(script.Parent.Components.Section)
    return Section.new(page, properties)
end

return Library