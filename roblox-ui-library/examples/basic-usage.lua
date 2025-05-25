local Library = require(script.Parent.src.Library)

local uiLibrary = Library.new()

local window = uiLibrary:CreateWindow({
    Title = "Basic Usage Example",
    Size = UDim2.new(0, 400, 0, 300),
    Position = UDim2.new(0.5, -200, 0.5, -150)
})

local page = window:AddPage({
    Title = "Main Page"
})

local section = page:AddSection({
    Title = "Controls"
})

local toggle = section:AddToggle({
    Name = "Enable Feature",
    DefaultState = false,
    Callback = function(state)
        print("Feature enabled:", state)
    end
})

local button = section:AddButton({
    Name = "Click Me",
    Callback = function()
        print("Button clicked!")
    end
})

local slider = section:AddSlider({
    Name = "Adjust Value",
    Min = 0,
    Max = 100,
    DefaultValue = 50,
    Callback = function(value)
        print("Slider value:", value)
    end
})

window:Open()