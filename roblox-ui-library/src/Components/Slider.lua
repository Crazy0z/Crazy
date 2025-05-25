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