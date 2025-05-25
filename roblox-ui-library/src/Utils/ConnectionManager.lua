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