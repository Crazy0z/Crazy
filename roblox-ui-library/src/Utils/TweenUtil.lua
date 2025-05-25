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