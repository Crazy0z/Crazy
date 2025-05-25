local Page = {}
Page.__index = Page

function Page.new(title)
    local self = setmetatable({}, Page)
    self.title = title or "New Page"
    self.sections = {}
    self.visible = false
    return self
end

function Page:addSection(section)
    table.insert(self.sections, section)
end

function Page:setVisible(visible)
    self.visible = visible
    -- Logic to show or hide the page in the UI
end

function Page:getTitle()
    return self.title
end

return Page