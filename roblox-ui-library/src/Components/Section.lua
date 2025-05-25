local Section = {}
Section.__index = Section

function Section.new(title)
    local self = setmetatable({}, Section)
    self.title = title or "New Section"
    self.components = {}
    return self
end

function Section:addToggle(properties)
    local toggle = Toggle.new(properties)
    table.insert(self.components, toggle)
    return toggle
end

function Section:addButton(properties)
    local button = Button.new(properties)
    table.insert(self.components, button)
    return button
end

function Section:addSlider(properties)
    local slider = Slider.new(properties)
    table.insert(self.components, slider)
    return slider
end

function Section:render()
    -- Render logic for the section and its components
end

return Section