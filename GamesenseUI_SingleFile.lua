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

--// FILE: Components/Button.lua
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

--// FILE: Components/Dropdown.lua
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

--// FILE: Components/Page.lua
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

--// FILE: Components/Section.lua
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

--// FILE: Components/Slider.lua
local Slider = {}
Slider.__index = Slider

function Slider.new(min, max, initial)
    local self = setmetatable({}, Slider)
    self.min = min or 0
    self.max = max or 100
    self.value = initial or self.min
    self.onValueChanged = nil
    return self
end

function Slider:SetValue(value)
    if value < self.min then
        value = self.min
    elseif value > self.max then
        value = self.max
    end
    self.value = value
    if self.onValueChanged then
        self.onValueChanged(value)
    end
end

function Slider:GetValue()
    return self.value
end

function Slider:SetOnValueChanged(callback)
    self.onValueChanged = callback
end

return Slider

--// FILE: Components/TextBox.lua
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

--// FILE: Components/Toggle.lua
local Toggle = {}
Toggle.__index = Toggle

function Toggle.new(initialState)
    local self = setmetatable({}, Toggle)
    self.state = initialState or false
    self.onToggle = nil
    return self
end

function Toggle:setState(newState)
    self.state = newState
    if self.onToggle then
        self.onToggle(self.state)
    end
end

function Toggle:getState()
    return self.state
end

function Toggle:onToggle(callback)
    self.onToggle = callback
end

return Toggle

--// FILE: Components/Window.lua
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

--// FILE: Types/index.lua
local Types = {}

Types.Window = {
    Title = "string",
    Size = "Vector2",
    IsOpen = "boolean",
}

Types.Page = {
    Name = "string",
    Sections = "table",
    IsVisible = "boolean",
}

Types.Section = {
    Title = "string",
    Components = "table",
}

Types.Toggle = {
    Label = "string",
    State = "boolean",
    OnToggle = "function",
}

Types.Button = {
    Label = "string",
    OnClick = "function",
}

Types.Slider = {
    Label = "string",
    Value = "number",
    MinValue = "number",
    MaxValue = "number",
    OnValueChanged = "function",
}

Types.TextBox = {
    PlaceholderText = "string",
    Text = "string",
    OnTextChanged = "function",
}

Types.Dropdown = {
    Options = "table",
    SelectedOption = "string",
    OnOptionSelected = "function",
}

return Types

--// FILE: Utils/ConnectionManager.lua
local ConnectionManager = {}
ConnectionManager.__index = ConnectionManager

function ConnectionManager.new()
    local self = setmetatable({}, ConnectionManager)
    self.connections = {}
    return self
end

function ConnectionManager:connect(event, callback)
    local connection = event:Connect(callback)
    table.insert(self.connections, connection)
    return connection
end

function ConnectionManager:disconnectAll()
    for _, connection in ipairs(self.connections) do
        connection:Disconnect()
    end
    self.connections = {}
end

return ConnectionManager

--// FILE: Utils/RenderUtil.lua
local RenderUtil = {}

function RenderUtil:CreateFrame(properties)
    local frame = Instance.new("Frame")
    for property, value in pairs(properties) do
        frame[property] = value
    end
    return frame
end

function RenderUtil:CreateTextLabel(properties)
    local textLabel = Instance.new("TextLabel")
    for property, value in pairs(properties) do
        textLabel[property] = value
    end
    return textLabel
end

function RenderUtil:CreateButton(properties)
    local button = Instance.new("TextButton")
    for property, value in pairs(properties) do
        button[property] = value
    end
    return button
end

function RenderUtil:CreateImage(properties)
    local image = Instance.new("ImageLabel")
    for property, value in pairs(properties) do
        image[property] = value
    end
    return image
end

return RenderUtil

--// FILE: Utils/TweenUtil.lua
local TweenService = game:GetService("TweenService")

local TweenUtil = {}

function TweenUtil:CreateTween(instance, properties, duration, easingStyle, easingDirection)
    local tweenInfo = TweenInfo.new(duration, easingStyle or Enum.EasingStyle.Linear, easingDirection or Enum.EasingDirection.Out)
    local tween = TweenService:Create(instance, tweenInfo, properties)
    return tween
end

function TweenUtil:PlayTween(tween)
    tween:Play()
    return tween.Completed
end

function TweenUtil:StopTween(tween)
    tween:Stop()
end

return TweenUtil
