local Library = require(script.Parent.src.Library)

local window = Library:CreateWindow({
    Title = "Advanced Features Example",
    Size = UDim2.new(0, 600, 0, 400),
})

local page = window:CreatePage({
    Title = "Animations and Interactions",
})

local section = page:CreateSection({
    Name = "Advanced Controls",
})

local toggle = section:CreateToggle({
    Name = "Enable Animation",
    State = false,
    Callback = function(state)
        if state then
            print("Animation Enabled")
        else
            print("Animation Disabled")
        end
    end,
})

local button = section:CreateButton({
    Name = "Animate Me!",
    Callback = function()
        if toggle.State then
            local tween = Library.TweenUtil:CreateTween(button, {Size = UDim2.new(1.2, 0, 1.2, 0)}, 0.5)
            tween:Play()
            tween.Completed:Wait()
            button.Size = UDim2.new(1, 0, 1, 0) -- Reset size after animation
        else
            print("Animation is disabled.")
        end
    end,
})

local slider = section:CreateSlider({
    Name = "Animation Speed",
    Min = 0.1,
    Max = 2,
    Default = 1,
    Callback = function(value)
        print("Animation Speed set to: " .. value)
    end,
})

local dropdown = section:CreateDropdown({
    Name = "Select Animation Type",
    Options = {"Bounce", "Fade", "Slide"},
    Callback = function(selected)
        print("Selected Animation Type: " .. selected)
    end,
})

window:Show()