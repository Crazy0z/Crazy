local TextBox = {}
TextBox.__index = TextBox

function TextBox.new(properties)
    local self = setmetatable({}, TextBox)
    
    self.Text = properties.text or ""
    self.PlaceholderText = properties.placeholder or "Enter text..."
    self.Size = properties.size or UDim2.new(0, 200, 0, 50)
    self.Position = properties.position or UDim2.new(0, 0, 0, 0)
    
    self.InputField = Instance.new("TextBox")
    self.InputField.Size = self.Size
    self.InputField.Position = self.Position
    self.InputField.Text = self.Text
    self.InputField.PlaceholderText = self.PlaceholderText
    self.InputField.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    self.InputField.TextColor3 = Color3.fromRGB(0, 0, 0)
    
    return self
end

function TextBox:GetText()
    return self.InputField.Text
end

function TextBox:SetText(text)
    self.InputField.Text = text
end

function TextBox:Clear()
    self.InputField.Text = ""
end

function TextBox:Render(parent)
    self.InputField.Parent = parent
end

return TextBox