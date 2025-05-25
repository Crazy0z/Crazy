local Window = {}
Window.__index = Window

function Window.new(properties)
    local self = setmetatable({}, Window)
    
    self.title = properties.title or "Untitled Window"
    self.size = properties.size or UDim2.new(0, 400, 0, 300)
    self.position = properties.position or UDim2.new(0.5, -200, 0.5, -150)
    self.isOpen = false

    self:initializeUI()
    
    return self
end

function Window:initializeUI()
    -- Create the main window UI element here
    self.uiElement = Instance.new("Frame")
    self.uiElement.Size = self.size
    self.uiElement.Position = self.position
    self.uiElement.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    self.uiElement.Visible = self.isOpen
    self.uiElement.Parent = game.CoreGui
end

function Window:open()
    self.isOpen = true
    self.uiElement.Visible = true
end

function Window:close()
    self.isOpen = false
    self.uiElement.Visible = false
end

function Window:setTitle(title)
    self.title = title
    -- Update the title UI element here if it exists
end

function Window:setSize(size)
    self.size = size
    self.uiElement.Size = size
end

function Window:setPosition(position)
    self.position = position
    self.uiElement.Position = position
end

return Window