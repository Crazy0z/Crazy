local Button = {}
Button.__index = Button

function Button.new(properties)
    local self = setmetatable({}, Button)
    
    self.text = properties.text or "Button"
    self.size = properties.size or UDim2.new(0, 100, 0, 50)
    self.position = properties.position or UDim2.new(0, 0, 0, 0)
    self.onClick = properties.onClick or function() end

    self.buttonInstance = Instance.new("TextButton")
    self.buttonInstance.Text = self.text
    self.buttonInstance.Size = self.size
    self.buttonInstance.Position = self.position
    self.buttonInstance.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    self.buttonInstance.TextColor3 = Color3.fromRGB(255, 255, 255)

    self.buttonInstance.MouseButton1Click:Connect(function()
        self.onClick()
    end)

    return self
end

function Button:Render(parent)
    self.buttonInstance.Parent = parent
end

function Button:SetText(newText)
    self.buttonInstance.Text = newText
end

function Button:SetSize(newSize)
    self.buttonInstance.Size = newSize
end

function Button:SetPosition(newPosition)
    self.buttonInstance.Position = newPosition
end

return Button