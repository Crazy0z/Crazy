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