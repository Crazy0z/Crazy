local Dropdown = {}
Dropdown.__index = Dropdown

function Dropdown.new(options, default)
    local self = setmetatable({}, Dropdown)
    self.options = options or {}
    self.selected = default or options[1]
    self.isOpen = false
    return self
end

function Dropdown:toggle()
    self.isOpen = not self.isOpen
end

function Dropdown:select(option)
    if table.find(self.options, option) then
        self.selected = option
        self:toggle()
    end
end

function Dropdown:getSelected()
    return self.selected
end

function Dropdown:getOptions()
    return self.options
end

return Dropdown