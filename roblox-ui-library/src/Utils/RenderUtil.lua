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